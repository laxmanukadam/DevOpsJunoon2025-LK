variable "aws_region" {
    description = "Name of a region"
    default = "eu-west-1"
}

locals {
  insatnce = {
    key1 = "Instance_1"
    key2 = "Instance_2"
  }
}

variable "ec2_instance_count" {
    description = "This is count of EC2 we are going to create"
  default = 2
}