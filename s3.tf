resource "aws_s3_bucket" "backup_s3" {
  bucket = "prod_backups11"
  versioning {
    enabled    = true
    mfa_delete = false
  }
}
