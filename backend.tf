terraform {

  backend "s3" {
    bucket = "${var.app_name}-bucket"
    key = "terraform.tfstate"
    region = "eu-west-2"
    encrypt = true
  }
}