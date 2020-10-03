# backup bucket
resource "aws_s3_bucket" "backup_s3" {
  bucket = "prod_backups10"
  versioning {
    enabled    = false
    mfa_delete = false
  }
}
