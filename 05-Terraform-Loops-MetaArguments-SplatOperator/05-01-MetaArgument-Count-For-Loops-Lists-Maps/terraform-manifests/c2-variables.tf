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

# AWS EC2 Instance Type - List
variable "instance_type_list" {
  description = "EC2 Instance type List"
  type = list(string)
  default = ["t2.nano", "t2.micro", "t2.small"]
}

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "EC2 Instance type Map"
  type = map(string)
  default = {
    "dev" = "t2.nano"
    "qa" = "t2.micro"
    "prod" = "t2.small"
  }
}