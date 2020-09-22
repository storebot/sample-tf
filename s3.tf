resource "aws_s3_bucket" "demo-example" {
  bucket = "demoexample112378"
  versioning {
    enabled = false
    mfa_delete = false
  }
}
