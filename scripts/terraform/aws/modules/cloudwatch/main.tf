locals {
  name = "${var.identifier}"
}

resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/${local.name}-app-task"
  retention_in_days = "365"
}