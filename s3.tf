resource "aws_s3_bucket" "demo-example" {
  bucket = "demoexample11237"
  versioning {
    enabled = false
    mfa_delete = false
  }
}
