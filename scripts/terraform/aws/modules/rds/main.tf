#-------------------------------------------------------------------------------
# Configure the Amazon Relational Database Service (Amazon RDS) 
#-------------------------------------------------------------------------------

locals {
  name = "${var.identifier}-mysql"
}

# KMS Key Managmment Service
data "aws_kms_key" "rds" {
  key_id = "alias/aws/rds"
}

#-------------------------------------------------------------------------------
# ASM Secret Manager
resource "random_password" "db_password"{
  length           = 20
  special          = true
  min_special       = 1
  override_special  = "!?"
}

resource "aws_secretsmanager_secret" "rds_secret" {
  name = "${local.name}-rds-secret"
}

resource "aws_secretsmanager_secret_version" "rds_secret" {
  secret_id = "${local.name}-rds-secret"
  secret_string = <<EOF
  {
  "DB_PASSWORD": "${random_password.db_password.result}",
  "DB_USERNAME": "${var.aws_rds_db_username}",
  "DB_PORT": "${var.aws_rds_port}"
  }
EOF
 depends_on = [ aws_secretsmanager_secret.rds_secret ]
}

#-------------------------------------------------------------------------------
# Subnets used by the databases
resource "aws_db_subnet_group" "db_sn_group" {
  name        = "${local.name}-rds-subnet-group"
  description = "Amazon Relational Database Service (Amazon RDS) subnet group."
  subnet_ids  = var.aws_rds_database_subnet_ids
}

#-------------------------------------------------------------------------------
# Postgres database instance
resource "aws_db_instance" "rds" {
  identifier                            = "${local.name}-rds"
  allocated_storage                     = var.aws_rds_allocated_storage
  auto_minor_version_upgrade            = var.aws_rds_auto_minor_version_upgrade
  backup_retention_period               = var.aws_rds_backup_retention_period
  engine                                = var.aws_rds_engine
  engine_version                        = var.aws_rds_engine_version
  enabled_cloudwatch_logs_exports       = var.aws_rds_cloudwatch_logs
  iam_database_authentication_enabled   = var.aws_rds_iam_database_authentication_enabled
  instance_class                        = var.aws_rds_instance_class
  monitoring_interval                   = var.aws_rds_monitoring_interval
  multi_az                              = var.aws_rds_multi_az
  db_name                               = var.aws_rds_database_name
  port                                  = var.aws_rds_port
  performance_insights_enabled          = var.aws_rds_performance_insights_enabled
  publicly_accessible                   = var.aws_rds_publicly_accessible
  skip_final_snapshot                   = var.aws_rds_skip_final_snapshot
  storage_encrypted                     = var.aws_rds_storage_encrypted
  storage_type                          = var.aws_rds_storage_type
  username                              = var.aws_rds_db_username
  password                              = "${random_password.db_password.result}"
  db_subnet_group_name                  = aws_db_subnet_group.db_sn_group.name
  vpc_security_group_ids                = var.aws_rds_vpc_security_group_ids
  kms_key_id                            = data.aws_kms_key.rds.arn

  depends_on = [ aws_db_subnet_group.db_sn_group, aws_secretsmanager_secret_version.rds_secret ]

}