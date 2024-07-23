# Resource: EC2 Instance
resource "aws_instance" "myec2instance" {
  ami = "ami-0b72821e2f351e396"
  instance_type = "t2.micro"
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    Name = "EC2InstanceDemo"
  }
}