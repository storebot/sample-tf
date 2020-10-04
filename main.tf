provider "aws" {
  region = "us-east-1"
}


#This is a comment
#do not use this in production
# this is a demo s3 bucket and does not have any security enabled

resource "aws_s3_bucket" "demo-s3" {
  bucket = "${var.s3_bucket_prefix}-terraformcloud"
  versioning {
    enabled    = false
    mfa_delete = false
  }
}

variable "s3_bucket_prefix" {
  default = "sample_prefix_test928"
}
