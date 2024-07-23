# Input Variables
# AWS Region
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}


# AWS EC2 Instance Key Pair
variable "ec2_keypair_name" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
  default = "terraform-aws-key"
}
