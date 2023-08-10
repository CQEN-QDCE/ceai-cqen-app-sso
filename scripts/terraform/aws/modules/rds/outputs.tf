#-------------------------------------------------------------------------------
# Configure the Amazon Relational Database Service (Amazon RDS) outputs
output "endpoint" {
    value = "${aws_db_instance.rds.endpoint}"
    description = "L'adresse IP de l'instance principale du serveur."
}

output "db_name" {
    value = aws_db_instance.rds.db_name
    description = "Le nom de la base de données RDS."
}

output "db_user_secret" {
    value = "${aws_secretsmanager_secret.rds_secret.arn}:DB_USERNAME::"
    description = "Référence vers le secret contenant le nom d'usager administrateur de la base de donnée MySQL"
}

output "db_password_secret" {
    value = "${aws_secretsmanager_secret.rds_secret.arn}:DB_PASSWORD::"
    description = "Référence vers le secret contenant le mot de passe administrateur de la base de donnée MySQL"
}

output "rds_arn" {
    value = aws_db_instance.rds.arn
    description = "L'ARN du cluster Postgres dans RDS."
}

output "rds_id" {
    value = aws_db_instance.rds.id
    description = "Id du cluster Postgres dans RDS"
}

output "rds_db_pass" {
    value = "${random_password.db_password.result}"
    description = "Le mot de passe administrateur de la base de donnée MySQL"
}

output "rds_db_deploy" {
    value = "${aws_db_instance.rds}"
    description = "La ressource aws pour voir si l'instance mysql est bien déployée"
}

