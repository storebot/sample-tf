resource "aws_vpc" "ptshggav1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_flow_log" "ptshggav1" {
  vpc_id          = "${aws_vpc.ptshggav1.id}"
  iam_role_arn    = "arn:aws:iam::333567660568:role/sample_role"
  log_destination = "${aws_s3_bucket.ptshggav1.arn}"
  traffic_type    = "ALL"

  tags = {
    GeneratedBy = "Accurics"
    ParentResourceId = "aws_vpc.ptshggav1"
  }
}

resource "aws_s3_bucket" "ptshggav1" {
  bucket = "ptshggav1_flow_log_s3_bucket"
  acl    = "private"
  force_destroy = true

  versioning {
    enabled = true
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

resource "aws_s3_bucket_policy" "ptshggav1" {
  bucket = "${aws_s3_bucket.ptshggav1.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ptshggav1-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::333567660568:role/role_name",
            "arn:aws:iam::333567660568:user/user_name"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.ptshggav1.id}/*"
    }
  ]
}
POLICY
}