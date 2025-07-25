provider "aws" {
    region = "us-east-1"
  
}
# terraform import aws_instance.name i-1234567890abcdef0
  

resource "aws_instance" "name" {

    ami = "ami-0cbbe2c6a1bb2ad63"
    instance_type = "t3.micro"
    tags = {
        Name = "manual"
    }


  
  
}