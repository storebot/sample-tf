resource "aws_security_group" "acme_web_wide_open" {
  name        = "acme_web_wide_open"
  description = "Used in the terraform"
  vpc_id      = "some_dummy_vpc"

  tags = {
    Name = "acme_web_wide_open"
  }

  # SSH access from anywhere
  ingress {
    to_port     = 65535
    from_port   = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0", "192.164.0.0/24"]
  }

  ingress {
    to_port     = 65535
    from_port   = 0
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0", "192.164.0.0/24"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
