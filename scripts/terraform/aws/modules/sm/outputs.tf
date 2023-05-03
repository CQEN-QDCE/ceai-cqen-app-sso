output "app_user_secret" {
    value = "${aws_secretsmanager_secret.app_secret.arn}:APP_USER::"
    description = "value of app_user_admin"
}

output "app_password_secret" {
    value = "${aws_secretsmanager_secret.app_secret.arn}:APP_PASS::"
    description = "value of app_admin_password"
  
}