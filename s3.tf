# backup bucket
# used for prod
# region us-east-1
resource "aws_s3_bucket" "backup_s3" {
  bucket = "prod_backups11"
  versioning {
    enabled    = false
    mfa_delete = false
  }
}
