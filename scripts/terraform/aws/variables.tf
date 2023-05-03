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
