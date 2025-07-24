resource "aws_security_group" "jaideep-securitygrp" {
    name        = "jaideep-securitygrp"
    description = "Security group for Jaideep's resources"
   
    ingress = [
        for port in [22, 80, 443, 8080, 9000, 3000, 8082, 8081]:{
            description = "allow traffic"
            from_port   = port
            to_port     = port
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            security_groups  = []
            self             = false


        }
  
    ]

    egress  {
            description      = "allow all outbound traffic"
            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
        }

    tags = {
        Name = "jaideep-securitygrp"
    }

}


  