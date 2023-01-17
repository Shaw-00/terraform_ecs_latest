resource "aws_security_group" "Terraform_sg" {
  name        = "Deployment_SG"
  description = "New sg for ECS"
  vpc_id      = "YOUR VPC ID"

  ingress {
    description      = "RDS"
    from_port         = 5432
    to_port           = 5432
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "Container"
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   }
 
}

resource "aws_default_subnet" "default_subnet_a" {
  availability_zone = "eu-west-2a"
}

resource "aws_default_subnet" "default_subnet_b" {
  availability_zone = "eu-west-2b"
}

resource "aws_default_subnet" "default_subnet_c" {
  availability_zone = "eu-west-2c"
}