resource "aws_vpc" "Myvpc" {

    cidr_block = "10.0.0.0/16"

    tags = {
      Name = "terraform_vpc"
    }
  
}

resource "aws_internet_gateway" "MyGateway" {

    vpc_id = aws_vpc.Myvpc.id

    tags = {
        Name = "terraform_gateway"
    }
  
}

resource "aws_subnet" "MySubnet" {

    vpc_id = aws_vpc.Myvpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "terraform_subnet"
    }
  
}

resource "aws_subnet" "private_subnet" {

    vpc_id = aws_vpc.Myvpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "terraform_private_subnet"
    }
  
}

resource "aws_route_table" "my_route_table" {

    vpc_id = aws_vpc.Myvpc.id
    route {

        cidr_block = "0.0.0.0/0"
        
        gateway_id = aws_internet_gateway.MyGateway.id
    }
    tags = {
        Name = "terraform_route_table"
    }
  
}


resource "aws_route_table_association" "public_subnet_association" {
    subnet_id      = aws_subnet.MySubnet.id
    route_table_id = aws_route_table.my_route_table.id
}



resource "aws_eip" "nat" {
  
  tags = {
    Name = "EIP for NAT Gateway"
  }
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.MySubnet.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.MyGateway,aws_subnet.MySubnet]
}

resource "aws_route_table" "private_route_table" {

    vpc_id = aws_vpc.Myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
    
        nat_gateway_id = aws_nat_gateway.example.id
    }

  
}

resource "aws_route_table_association" "private_subnet_association" {
    subnet_id      = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_route_table.id
}

resource "aws_instance" "name" {

    ami = var.ami_id
    instance_type = "t3.micro"
    subnet_id = aws_subnet.MySubnet.id
    associate_public_ip_address = true

    tags = {
      Name = "terraform_instance"
    }
     vpc_security_group_ids = [ aws_security_group.allow_tls.id]
  
}


resource "aws_instance" "private" {

    ami = var.ami_id
    instance_type = "t3.micro"
    subnet_id = aws_subnet.private_subnet.id
    associate_public_ip_address = false
    tags = {
      Name = "terraform_private_instance"
    }
    vpc_security_group_ids = [ aws_security_group.allow_tls.id]
  
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.Myvpc.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
}
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #all protocols 
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}

