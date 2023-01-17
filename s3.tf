resource "aws_s3_bucket" "terrafrom-state" {
    bucket = "${var.app_name}-bucket"
}



