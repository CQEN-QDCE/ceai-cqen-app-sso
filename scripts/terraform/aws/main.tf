locals {
  name = "${var.app_name}-${var.environment}"
  container_name = "${var.app_name}-container"
}

module "ceai_lib" {
  source = "github.com/CQEN-QDCE/ceai-cqen-terraform-lib?ref=sea-cicd-codebuild"
}

# network
module "sea_network" {
  source = "./.terraform/modules/ceai_lib/aws/sea-network"

  aws_profile = var.aws_profile
  workload_account_type = var.workload_account_type  
}

# Configure the Amazon Relational Database Service (Amazon RDS) module
module "rds" {
  source                                      = "./modules/rds"
  identifier                                  = local.name
  aws_rds_application                         = var.app_name
  aws_rds_environment                         = var.environment
  aws_rds_database_subnet_ids                 = module.sea_network.data_subnets.ids
  aws_rds_allocated_storage                   = 20
  aws_rds_auto_minor_version_upgrade          = true
  aws_rds_backup_retention_period             = 0
  aws_rds_cloudwatch_logs                     = ["postgresql", "upgrade"]
  aws_rds_engine                              = "postgres"
  aws_rds_engine_version                      = "11.16"
  aws_rds_iam_database_authentication_enabled = false
  aws_rds_instance_class                      = "db.t3.small"
  aws_rds_monitoring_interval                 = 0
  aws_rds_multi_az                            = true
  aws_rds_database_name                       = var.app_name
  aws_rds_db_username                         = var.app_name
  aws_rds_performance_insights_enabled        = false
  aws_rds_port                                = 5432
  aws_rds_publicly_accessible                 = false
  aws_rds_skip_final_snapshot                 = false
  aws_rds_storage_encrypted                   = true
  aws_rds_storage_type                        = "gp2"
  aws_rds_vpc_security_group_ids              = [module.sea_network.data_security_group.id]
}

module "ecr" {
  source = "./modules/ecr"

  identifier = local.name  
}

# ecs
module "ecs_cluster" {
  source = "./.terraform/modules/ceai_lib/aws/sea-ecs-cluster"
  
  identifier = local.name
}

module "sm" {
  source = "./modules/sm"

  identifier            = local.name
  app_admin_username    = var.app_name
}

data "template_file" "container_task_def_tpl" {
  template = file("${path.module}/tasks/keycloak_task_def.json.tftpl")
  vars = {
    aws_region           = var.aws_region
    container_name       = local.container_name
    app_image            = "${module.ecr.ecr_image_uri}:latest"
    awslogs_group        = "/ecs/${local.name}-app-task"
    container_port       = 8080
    db_vendor            = "postgres"
    db_addr              = module.rds.endpoint
    db_name              = var.app_name
    app_host_name        = var.app_hostname
    app_admin_username   = module.sm.app_user_secret
    app_admin_password   = module.sm.app_password_secret
    healthckeck_path     = "/auth/health"
    db_admin_username    = module.rds.db_user_secret
    db_admin_password    = module.rds.db_password_secret
  }
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  identifier            = local.name  
}

module "sea_ecs_service" {
  source = "./.terraform/modules/ceai_lib/aws/sea-ecs-fargate-service"
  
  sea_network = module.sea_network
  identifier  = local.name
  #ecs_cluster_id = module.ecs_cluster.cluster_id
  task_definition = data.template_file.container_task_def_tpl.rendered
  task_container_name = local.container_name
  task_port = 8080
  task_protocol = "HTTP"
  task_vcpu = 1024
  task_memory = 2048
  #task_count = 1
  
  task_minimum_count = 1
  task_maximum_count = 1
  ecs_cluster = module.ecs_cluster
  
  task_healthcheck_path = "/auth/health"
  task_healthcheck_protocol = "HTTP"
}

/*
module "backup" {
  source = "./.terraform/modules/ceai_lib/aws/sea-backup"

  aws_profile            = var.aws_profile
  identifier             = local.name
  backup_rules           = var.backup_rules
  backup_alarms_email    = var.backup_alarms_email
  backup_ressources_arn  = [ module.rds.rds_arn ]  
}*/

module "sea_cicd_codebuild" {
  source = "./.terraform/modules/ceai_lib/aws/sea-cicd-codebuild"

  identifier = local.name
  app_name = var.app_name
  app_ecr_repository_name = module.ecr.ecr_name
  app_ecs_container_name = local.container_name
  account_id = var.account_id
  github_repo_url = var.github_repo_url
  app_buildspec_path = var.app_buildspec_path
  github_repo_branch = var.github_repo_branch
  app_path = var.app_path
}

module "sea_cicd_pipeline" {
  source = "./.terraform/modules/ceai_lib/aws/sea-cicd-codepipeline"

  identifier = local.name
  aws_codecommit_repository_default_branch = module.sea_cicd_codebuild.aws_codecommit_repository_default_branch
  aws_codecommit_repository_name = module.sea_cicd_codebuild.aws_codecommit_repository_name
  ecs_cluster_name = module.ecs_cluster.cluster_name
  ecs_service_name = module.sea_ecs_service.ecs_service_name
}