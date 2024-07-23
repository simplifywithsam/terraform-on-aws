# EC2 Instance
resource "aws_instance" "terraformec2vm" {
  ami = data.aws_ami.amzlinux2023.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.ec2_keypair_name
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id, aws_security_group.allow_web.id   ]
  tags = {
    "Name" = "Terraform EC2 Demo 2"
  }
}
