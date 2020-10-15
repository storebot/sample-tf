resource "aws_security_group" "acme_web_wide_open" {
  name        = "acme_web_wide_open_3"
  description = "Used in the terraform"
  vpc_id      = "some_dummy_vpc"

  tags = {
    Name = "acme_web_wide_open"
  }

  # SSH access from anywhere
  ingress {
    to_port     = 22
    from_port   = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
