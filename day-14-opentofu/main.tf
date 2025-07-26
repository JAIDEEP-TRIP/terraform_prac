provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "name" {
    ami = "ami-05ffe3c48a9991133"
    instance_type = "t3.micro"
    #key_name = "test"
    tags = {
        Name = "example-instance"
    }
  
}

# tofu inti
# tofu plan
# tofu apply
