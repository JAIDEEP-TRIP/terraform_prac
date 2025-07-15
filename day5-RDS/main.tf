resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "my_igw"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "subnet2"
  }
}

resource "aws_db_subnet_group" "sub_grp" {
  name       = "mycutsubnet2"
  subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "mydbsecuritygroup"
  description = "Database security group"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "Allow MySQL traffic"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ❗Open to all (only use for test/demo)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DB SG"
  }
}

resource "aws_db_instance" "my_rds" {
  identifier              = "my-rds-instance"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  db_name                 = "myappdb"
  username                = "admin"
  password                = "admin1234"
  db_subnet_group_name    = aws_db_subnet_group.sub_grp.name
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = false

  depends_on = [aws_db_subnet_group.sub_grp]
}

output "rds_endpoint" {
  value = aws_db_instance.my_rds.endpoint
}
