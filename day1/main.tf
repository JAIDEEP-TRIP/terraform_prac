resource "aws_s3_bucket" "name" {
    bucket = "terraform-bucket122438urnfjdv98rg"
  
}

resource "aws_instance" "name" {
    ami = "ami-05ffe3c48a9991133"
    instance_type = "t2.micro"
  
}