resource "aws_instance" "first-infra" {
  ami                     = "ami-06f855639265b5541" # Set an appropriate AMI ID
  instance_type           = "t2.micro"
  
  tags = {
    Name = "test-infra" # Set the tag to identify
  }
}
