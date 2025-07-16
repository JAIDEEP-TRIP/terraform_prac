resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance
    availability_zone = var.availability
    key_name = var.key
  
}