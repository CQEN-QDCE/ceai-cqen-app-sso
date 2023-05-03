locals {
  name = "${var.identifier}"
}

#-------------------------------------------------------------------------------
# ASM Secret Manager
resource "random_password" "app_password"{
  length           = 20
  special          = true
  min_special       = 1
  override_special  = "!?"
}

resource "aws_secretsmanager_secret" "app_secret" {
  name = "${local.name}-app-secret"
}

resource "aws_secretsmanager_secret_version" "app_secret" {
  secret_id = "${local.name}-app-secret"
  secret_string = <<EOF
  {
  "KEYCLOAK_ADMIN": "${var.app_admin_username}", 
  "KEYCLOAK_ADMIN_PASSWORD": "${random_password.app_password.result}"
  }
EOF
 depends_on = [ aws_secretsmanager_secret.app_secret ]
}