provider "aws" {
  region = "us-east-1"
  
}

locals {
    instance_ami = "ami-0cbbe2c6a1bb2ad63" 
    instance_type = "t3.micro" 
  
}

resource "aws_instance" "name" {
    ami           = local.instance_ami
    instance_type = local.instance_type


    tags = {
        Name = "MyInstance23"
    }
  
}