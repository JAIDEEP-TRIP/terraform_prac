provider "aws" {
  region = "us-east-1"
  
}


# resource "aws_instance" "name" {
#     ami           = "ami-0cbbe2c6a1bb2ad63" 
#     instance_type = "t3.micro"
#     count        = 3

#     tags = {

#         Name = "dev-${count.index}"
  
# }
# }

variable "env" {
    type    = list(string)
    default = [ "prod","test"]

  
}

resource "aws_instance" "name" {
    ami = "ami-0cbbe2c6a1bb2ad63"
    instance_type = "t3.micro"
    count =length(var.env)
    tags = {
        Name = "dev-${var.env[count.index]}"
    }

  
}

variable "usernames" {  
    type = list(string)
    default = [ "user1" ,"user2", "user3"]
  
}

resource "aws_iam_user" "name" {
    count = length(var.usernames)
    name  = var.usernames[count.index]
  
    tags = {
        Name = var.usernames[count.index]
    }
  
}