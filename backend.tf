terraform {
  backend "s3" {
    bucket         = "mybucket-terraform-1-2"
    key            = "network/terraform.tfstate"
    region         = "eu-west-2"
  }
}
