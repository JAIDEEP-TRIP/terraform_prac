variable "instance_type" {
    type    = string
    default = "t3.micro"
  
}

variable "ami_id" {
    type    = string
    default = "ami-0cbbe2c6a1bb2ad63"
  
}

variable "env"{
    type = list(string)
    default = [ "test", "prod"]
}

provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "name" {
   # count         = length(var.env)
   for_each = toset(var.env)
    ami           = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = each.value
        
    }
  
}