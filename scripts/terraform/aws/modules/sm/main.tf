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
  name = "${local.name}-app-secret-3"
}

resource "aws_secretsmanager_secret_version" "app_secret" {
  secret_id = aws_secretsmanager_secret.app_secret.id
  secret_string = <<EOF
  {
  "APP_ADMIN_USER": "${var.app_admin_username}", 
  "APP_ADMIN_PASSWORD": "${random_password.app_password.result}"
  }
EOF
 depends_on = [ aws_secretsmanager_secret.app_secret ]
}