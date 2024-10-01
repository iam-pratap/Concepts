resource "aws_instance" "first-infra" {
  ami                     = "ami-08718895af4dfa033" # Set an appropriate AMI ID
  instance_type           = "t2.micro"
  
  tags = {
    Name = "test-infra" # Set the tag to identify
  }
}
