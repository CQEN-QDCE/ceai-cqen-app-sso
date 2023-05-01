#-------------------------------------------------------------------------------
# Configure the Amazon Relational Database Service (Amazon RDS) variables
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Global variables
variable "identifier" {
  description = "Nom unique pour identifier les ressources AWS"
  type = string
}

variable "aws_rds_application" {
    type        = string
    description = "The application's name."
    sensitive   = false
}

variable "aws_rds_environment" {
    type        = string
    description = "The deployment environment (dev, prod). Default = \"dev\"."
    sensitive   = false
    default     = "dev"
}

#-------------------------------------------------------------------------------
# Subnet groups
variable "aws_rds_database_subnet_ids" {
    type        = list(string)
    description = "A list of VPC subnet IDs."
    sensitive   = false
}

#-------------------------------------------------------------------------------
# Database instance
variable "aws_rds_allocated_storage" {
    type        = number
    description = "The allocated storage in gigabytes"
    sensitive   = false
}

variable "aws_rds_auto_minor_version_upgrade" {
    type        = bool
    description = "Indicates that major version upgrades are allowed."
    sensitive   = false
}

variable "aws_rds_backup_retention_period" {
    type        = number
    description = "The days to retain backups for. Must be between 0 and 35."    
    sensitive   = false
}

variable "aws_rds_cloudwatch_logs" {
  type        = list(string)
  description = "Set of log types to enable for exporting to CloudWatch logs."
  sensitive   = false
}

variable "aws_rds_engine" {
    type        = string
    description = "The database engine to use."    
    sensitive   = false
}

variable "aws_rds_engine_version" {
    type        = string
    description = "The engine version to use."
    sensitive   = false
}

variable "aws_rds_iam_database_authentication_enabled" {
    type        = bool
    description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
    sensitive   = false
}

variable "aws_rds_instance_class" {
    type        = string
    description = "The instance type of the RDS instance."
    sensitive   = false
}

variable "aws_rds_monitoring_interval" {
    type        = number
    description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance."
    sensitive   = false
}

variable "aws_rds_multi_az" {
    type        = string
    description = "Specifies if the RDS instance is multi-AZ."
    sensitive   = false
}

variable "aws_rds_database_name" {
    type        = string
    description = "The name of the database to create when the DB instance is created."
    sensitive   = false
}

variable "aws_rds_performance_insights_enabled" {
  type        = bool
  description = "Specifies whether Performance Insights are enabled. "
  sensitive   = false
}

variable "aws_rds_port" {
    type        = number
    description = "The port on which the DB accepts connections."
    sensitive   = false
}

variable "aws_rds_publicly_accessible" {
  type        = bool
  description = "Bool to control if instance is publicly accessible."
  sensitive   = false
}

variable "aws_rds_skip_final_snapshot" {
    type        = bool
    description = "Skip final snapshot"
    sensitive   = false
}

variable "aws_rds_storage_encrypted" {
    type        = bool
    description = "Encrypter le stockage"
    sensitive   = false
}

variable "aws_rds_storage_type" {
    type        = string
    description = "One of \"standard\" (magnetic), \"gp2\" (general purpose SSD), or \"io1\" (provisioned IOPS SSD). The default is \"io1\" if iops is specified, \"gp2\" if not."
    sensitive   = false
}

variable "aws_rds_vpc_security_group_ids" {
    type        = list(string)
    description = "List of VPC security groups to associate."
    sensitive   = false
}

variable "aws_rds_db_username" {
    type = string
    description = "RDS Database Username"
}