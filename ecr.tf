resource "aws_ecr_repository" "my_first_ecr_repo" {
  name = "${var.app_name}-ecr" 
  tags = {
    Name        = "latest-ecr"
  }
}