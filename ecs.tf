resource "aws_ecs_cluster" "my_cluster" {

  name = "${var.app_name}-cluster" 
}