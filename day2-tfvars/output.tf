output "my_server_id" {
    value = aws_instance.tfvars-dev.public_ip
  
}