resource "aws_vpc" "ptshggav1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_flow_log" "ptshggav1" {
  vpc_id          = "${aws_vpc.ptshggav1.id}"
  iam_role_arn    = "arn:aws:iam::333567660568:role/sample_role"
  log_destination = "arn:aws:s3:::bucket_name"
  traffic_type    = "ALL"

  tags = {
    GeneratedBy = "Accurics"
    ParentResourceId = "aws_vpc.ptshggav1"
  }
}