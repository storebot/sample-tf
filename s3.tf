resource "aws_s3_bucket" "demo-example" {
  bucket = "demoexample3333"
  versioning {
    enabled = false
    mfa_delete = false
  }
}
