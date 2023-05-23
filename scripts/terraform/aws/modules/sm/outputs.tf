output "app_user_secret" {
    value = "${aws_secretsmanager_secret.app_secret.arn}:APP_ADMIN_USER::"
    description = "value of app_user_admin"
}

output "app_password_secret" {
    value = "${aws_secretsmanager_secret.app_secret.arn}:APP_ADMIN_PASSWORD::"
    description = "value of app_admin_password"
  
}