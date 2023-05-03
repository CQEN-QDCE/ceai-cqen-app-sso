variable "identifier" {
  description = "Nom unique pour identifier les ressources AWS"
  type = string
}

variable "app_admin_username" {
  description = "Nom d'utilisateur de l'application"
  sensitive = true
}
