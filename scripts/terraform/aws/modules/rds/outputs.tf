#-------------------------------------------------------------------------------
# Configure the Amazon Relational Database Service (Amazon RDS) outputs
output "aws_rds_endpoint" {
    value = "${aws_db_instance.rds.endpoint}"
    description = "The private IP address of the main server instance."
}

output "aws_secretsmanager_rds_arn" {
    value = "${aws_secretsmanager_secret.rds_secret.arn}"
    description = "The ARN of RDS secret manager."
}

output "aws_rds_arn" {
    value = aws_db_instance.rds.arn
}

output "aws_rds_name" {
    value = aws_db_instance.rds.db_name
}