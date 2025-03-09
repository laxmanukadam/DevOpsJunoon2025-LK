terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.89.0"
    }
  }
  
 # backend  "s3" {
 #   bucket = "terraform-state-dynamodb-bucket"
 #   dynamodb_table = "s3-state-dynamodb-table"
 #   key = "terraform.tfstate"
 #   region = "eu-west-1"
 # }
}

provider "aws" {
  region = "eu-west-1"
  
}
