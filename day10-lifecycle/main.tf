resource "aws_instance" "name" {
    ami = "ami-0150ccaf51ab55a51"
    instance_type = "t3.micro"
    availability_zone = "us-east-1a"

    tags = {
        Name = "lifecycle-instance"
    }
#   lifecycle{
#     create_before_destroy = true
# }
# lifecycle {
#     prevent_destroy = true
# }
lifecycle {
    ignore_changes = [tags]
}
}


