resource "aws_vpc" "main" {
  cidr_block = var.cidr_block


}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.az

}

resource "aws_subnet" "subent2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet2_cidr_block
  availability_zone = var.az2
  
}

output "subnet_id" {
  value = aws_subnet.main.id
}

output "subnet2_id" {
  value = aws_subnet.subent2.id
}

