resource "aws_db_subnet_group" "subnet_group" {
  name       = "my-subnet-group"
  subnet_ids = var.subnet_ids

}

resource "aws_db_instance" "rds_instance" {
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.instance_class
  db_name                 = var.db_name
  username                = var.db_user
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.subnet_group.name
  publicly_accessible     = false
  skip_final_snapshot     = true


}
