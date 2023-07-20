variable "aws_profile" {
  type = string
  description = "Nom du profil de connexion SSO dans le fichier .aws/config du poste qui exécute le déploiement"
}

variable "aws_region" {
  type = string
  description = "a specific AWS region"  
}

variable "workload_account_type" {
  type = string
  description = "Type de compte de travail ASEA (Prefix du VPC partagé) [Sandbox, Dev, Prod]"
}

variable "system" {
  type = string
  description = "Nom du système déployé."
  default = "Exemple"
}

variable "environment" {
  type = string
  description = "Nom de l'environnement du sytème déployé."
}

variable "app_name" {
  type = string
  description = "Nom de l'application."
}

variable "app_hostname" {
  type = string
  description = "Nom du host de l'application."
}

variable "scheme" {
  type = string
  description = "Scheme pour l'URL de l'application. [https, http]"
}

variable "github_repo_url" {
  type = string
  description = "URL du repo GitHub de l'application."
}

variable "github_repo_branch" {
  type = string
  description = "Branch du repo GitHub de l'application."  
}

variable "app_buildspec_path" {
  type = string
  description = "Path du fichier buildspec de l'application dans le repo GitHub."  
}

variable "app_path" {
  type = string
  description = "Path de l'application dans le repo GitHub."
}  

variable "app_route53_zone_id" {
  type = string
  description = "ID de la zone hebergé de la Route53."
} 

# ===================================================
# Global variables for Backup
# ---------------------------------------------------

variable "backup_alarms_email" {
    type = string
    description = "The Delivers messages via SMTP. endpoint is an email address"
}

variable "backup_rules" {
    type = list(object({
      name                     = string
      schedule                 = string
      start_window             = number
      completion_window        = number
      delete_after             = number
      enable_continuous_backup = bool
    }))
    description = "The rule object that specifies a scheduled task that is used to back up a selection of resources"
}