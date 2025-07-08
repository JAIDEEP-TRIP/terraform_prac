output "ip_intialserver" {
    value = aws_instance.name.public_ip
}

output "ip_newserver" {
    value = aws_instance.newserver.private_ip
}