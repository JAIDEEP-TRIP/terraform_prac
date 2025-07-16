resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "custom_password_vpc"
    }
  
}

resource "aws_subnet" "name" {
    vpc_id     = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "subnet1"
    }
}

resource aws_subnet "subnet2" {
    vpc_id     = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name ="subnet2"
    }
    
    
    }

resource "aws_db_subnet_group" "name" {
    name = "custom subnet grp"
    subnet_ids = [aws_subnet.name.id, aws_subnet.subnet2.id]
    tags = {
        Name = "custom subnet grp"
    }
  
}

resource "aws_db_instance" "name" {
    identifier = "custom-password-db"
    allocated_storage = 20
    engine = "mysql"
    engine_version = "8.0.41"
    instance_class = "db.t3.micro"
    username = "admin"
    manage_master_user_password = true
    db_subnet_group_name = aws_db_subnet_group.name.id
    skip_final_snapshot = true
    
  
}