resource "aws_cloudwatch_log_group" "log-group" {
  name = "${var.app_name}-logs"
  retention_in_days = 7

}