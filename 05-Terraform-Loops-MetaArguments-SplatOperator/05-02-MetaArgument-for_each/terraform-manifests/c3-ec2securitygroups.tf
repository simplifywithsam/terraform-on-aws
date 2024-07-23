# Create Security Group - SSH Traffic
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_ssh"
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_traffic" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}



# Create Security Group - Web Traffic
resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_web"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_web_traffic" {
  security_group_id = aws_security_group.allow_web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_web_ssl_traffic" {
  security_group_id = aws_security_group.allow_web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


