# Availability Zones Datasource
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


# EC2 Instance
resource "aws_instance" "terraformec2vm" {
  ami = data.aws_ami.amzlinux2023.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.ec2_keypair_name
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id, aws_security_group.allow_web.id   ]
  # Create EC2 Instance in all Availabilty Zones of a VPC  
  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key  # You can also use each.value because for list items each.key == each.value
  tags = {
    "Name" = "Terra-EC2-Demo-${each.value}"
  }
}
