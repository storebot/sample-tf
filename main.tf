provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo-s3" {
  bucket = "${var.s3_bucket_prefix}-terraformcloud"
  versioning {
    enabled = false
    mfa_delete = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }  
}

variable "s3_bucket_prefix" {
  default = "prefix20200904"
}
