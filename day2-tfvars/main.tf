resource "aws_instance" "tfvars"{
    ami           = var.ami_id
    instance_type = var.instance_type
}

resource "aws_instance" "tfvars-dev"{
    ami           = var.ami_id
    instance_type = var.instance_type

    tags = {
      Name = "tfvars-dev-server"
    }
}
