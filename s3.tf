resource "aws_s3_bucket" "backup_s3" {
  bucket = "prod_backups8"
  versioning {
    enabled    = false
    mfa_delete = false
  }
}
