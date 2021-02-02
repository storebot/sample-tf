resource "aws_s3_bucket" "backup_s3" {
  bucket = "prod_backups11"
  versioning {
    enabled    = true
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

resource "aws_s3_bucket_policy" "backup_s3" {
  bucket = "${aws_s3_bucket.backup_s3.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "backup_s3-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            arn:aws:iam::641885301384:role/Accurics_Read_Only_Role,
            <specific_user_arn>
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.backup_s3.id}/*"
    }
  ]
}
POLICY
}