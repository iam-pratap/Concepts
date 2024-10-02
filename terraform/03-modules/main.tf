provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-06f855639265b5541" # replace this
  instance_type_value = "t2.micro"
  key_name_value = "Security". # replace this
}
