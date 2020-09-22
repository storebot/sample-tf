resource "aws_s3_bucket" "demo-example" {
  bucket = "demoexample1123"
  versioning {
    enabled = false
    mfa_delete = false
  }
}
