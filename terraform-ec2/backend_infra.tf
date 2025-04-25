resource "aws_s3_bucket" "s3-backend-dynamodb" {
    
    bucket = "terraform-state-dynamodb-bucket"
    tags = {
      name= "my terraform state bucket"
    }
  
}




resource "aws_dynamodb_table" "my-dynamodb-table" {
    name = "s3-state-dynamodb-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
  
}
