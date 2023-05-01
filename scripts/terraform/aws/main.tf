locals {
  name = "${var.app_name}-${var.environment}"
  container_name = "${var.app_name}-container"
}

module "ceai_lib" {
  source = "github.com/CQEN-QDCE/ceai-cqen-terraform-lib?ref=sea-pipeline"
}

# network
module "sea_network" {
  source = "./.terraform/modules/ceai_lib/aws/sea_network"

  aws_profile = var.aws_profile
  workload_account_type = var.workload_account_type  
}

# Configure the Amazon Relational Database Service (Amazon RDS) module
module "rds" {
  source                                      = "./modules/rds"
  identifier                                  = local.name
  aws_rds_application                         = var.app_name
  aws_rds_environment                         = var.environment
  aws_rds_database_subnet_ids                 = var.sea_network.data_subnets.ids
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
  aws_rds_vpc_security_group_ids              = [var.sea_network.data_security_group.id]
}
/*
module "ecr" {
  source = "./modules/ecr"

  identidentifier = local.name  
}

# ecs
module "ecs_cluster" {
  source = "./.terraform/modules/ceai_lib/aws/sea-ecs-cluster"
  
  identifier = local.name
}

data "template_file" "container_task_def_tpl" {
  template = file("${path.module}/tasks/keycloak_task_definition.tftpl")
  vars = {
    aws_region           = var.aws_region
    container_name       = local.container_name
    app_image            = "${module.ecr.ecr_image_uri}:latest"
    awslogs_group        = "/ecs/${local.name-task}"
    container_port       = 8080
    healthckeck_path     = "/healthcheck"
    environment          = terraform.workspace
    mysql_user_secret    = module.mysql.db_user_secret
    mysql_user_password  = module.mysql.db_password_secret
  }
}

module "ecs_service" {
  source = "./.terraform/modules/ceai_lib/aws/sea-ecs-fargate-service"
  
  sea_network = module.sea_network.all
  identifier  = local.name
  ecs_cluster_id = module.ecs_cluster.cluster_id
  task_definition = data.template_file.container_task_def_tpl.rendered
  task_container_name = local.container_name
  task_port = 8080
  task_protocol = "HTTP"
  task_vcpu = 512
  task_memory = 1
  task_count = 1
  task_healthcheck_path = "/healthcheck"
  task_healthcheck_protocol = "HTTP"
}*/