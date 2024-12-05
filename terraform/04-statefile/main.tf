provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "honey" {
  instance_type = "t2.micro"
  ami = "ami-0327f51db613d7bd2" # change this
  subnet_id = "subnet-0e7e3e4f02bed0f27" # change this
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "honey-s3-demo-statefile" # change this
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
