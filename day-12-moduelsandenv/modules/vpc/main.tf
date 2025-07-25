

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
 
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
 
  tags = {
    Name = "${var.env}-public-subnet"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr2
  availability_zone       = var.availability_zone2

  tags = {
    Name = "${var.env}-public-subnet2"
  }
}


output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "public_subnet_id2" {
  value = aws_subnet.public2.id
}
