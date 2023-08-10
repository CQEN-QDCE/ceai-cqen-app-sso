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
    description = "Le nom de l'application."
    sensitive   = false
}

variable "aws_rds_environment" {
    type        = string
    description = "L'environnement de déploiement (dev, prod). Défaut = \"dev\"."
    sensitive   = false
    default     = "dev"
}

#-------------------------------------------------------------------------------
# Subnet groups
variable "aws_rds_database_subnet_ids" {
    type        = list(string)
    description = "La liste des IDs des subnetsA du VPC."
    sensitive   = false
}

#-------------------------------------------------------------------------------
# Database instance
variable "aws_rds_allocated_storage" {
    type        = number
    description = "Le stockage assigné en gigabytes"
    sensitive   = false
}

variable "aws_rds_auto_minor_version_upgrade" {
    type        = bool
    description = "Indique que la mise à jour de versions plus récentes est permise."
    sensitive   = false
}

variable "aws_rds_backup_retention_period" {
    type        = number
    description = "La période de rétention du backup en jours (entre 0 et 35)."    
    sensitive   = false
}

variable "aws_rds_cloudwatch_logs" {
  type        = list(string)
  description = "Ensemble de type de logs pour exporter vers les logs CloudWatch."
  sensitive   = false
}

variable "aws_rds_engine" {
    type        = string
    description = "Le moteur de base de données à utiliser."    
    sensitive   = false
}

variable "aws_rds_engine_version" {
    type        = string
    description = "La version du moteur de base de données à utiliser."
    sensitive   = false
}

variable "aws_rds_iam_database_authentication_enabled" {
    type        = bool
    description = "Indique si l'option d'authentification avec AWS Identity and Access Management (IAM) est activée."
    sensitive   = false
}

variable "aws_rds_instance_class" {
    type        = string
    description = "Le type d'instance du RDS."
    sensitive   = false
}

variable "aws_rds_monitoring_interval" {
    type        = number
    description = "L'intervalle, en seconds, entre les moments de la collecte de métriques (Enhanced Monitoring) pour l'instance de base de données."
    sensitive   = false
}

variable "aws_rds_multi_az" {
    type        = string
    description = "Indique si l'instance RDS est multi-AZ."
    sensitive   = false
}

variable "aws_rds_database_name" {
    type        = string
    description = "Le nom de la base de données à créer pour l'instance DB."
    sensitive   = false
}

variable "aws_rds_performance_insights_enabled" {
  type        = bool
  description = "Indique si Performance Insights est activé. "
  sensitive   = false
}

variable "aws_rds_port" {
    type        = number
    description = "Le port de connection à la base de données."
    sensitive   = false
}

variable "aws_rds_publicly_accessible" {
  type        = bool
  description = "Indique si l'instance est accessible publiquement."
  sensitive   = false
}

variable "aws_rds_skip_final_snapshot" {
    type        = bool
    description = "Indique si le snapshot final est sauté"
    sensitive   = false
}

variable "aws_rds_storage_encrypted" {
    type        = bool
    description = "Indique si le stockage est crypté"
    sensitive   = false
}

variable "aws_rds_storage_type" {
    type        = string
    description = "Un de \"standard\" (magnetic), \"gp2\" (general purpose SSD), ou \"io1\" (provisioned IOPS SSD). Par défaut c'est \"io1\" si iops est specifié, \"gp2\" si non."
    sensitive   = false
}

variable "aws_rds_vpc_security_group_ids" {
    type        = list(string)
    description = "Liste d'IDs des groups de sécurité du VPC qui seront associés."
    sensitive   = false
}

variable "aws_rds_db_username" {
    type = string
    description = "Le nom de l'utilisateur de la base de données RDS"
}