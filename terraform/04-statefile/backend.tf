terraform {
  backend "s3" {
    bucket         = "honey-s3-demo-statefile" # change this
    key            = "honey/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
