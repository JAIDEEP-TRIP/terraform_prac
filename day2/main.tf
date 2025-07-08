resource "aws_instance" "name" {
    ami           = var.ami_id
    instance_type = var.instance_type
}

resource "aws_instance" "newserver" {
    ami           = var.ami_id
    instance_type = var.instance_type

    tags = {
      name = "newserver"
    }
}

resource "aws_instance" "nanoserver"{
    ami = var.ami_id
    instance_type = var.instance_type

    tags = {
        Name = "nanoserver"
    }

}