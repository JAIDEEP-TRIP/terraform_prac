provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "name" {

    ami           = "ami-0cbbe2c6a1bb2ad63" # Example AMI ID, replace with a valid one
    instance_type = "t3.micro"# Replace with your key pair name
    user_data = file("test.sh")


    tags = {
        Name = "MyInstance"
    }
  
}