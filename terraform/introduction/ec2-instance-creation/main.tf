resource "aws_instance" "first-infra" {
  ami                     = "ami-08718895af4dfa033"
  instance_type           = "t2.micro"
  
  tags = {
    Name = "test-infra"
  }
}
