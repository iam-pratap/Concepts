provider "aws" {
    region = "ap-south-1"
  
}

import {
  id = "i-04cada09773b9e67a"

  to = aws_instance.example
}
