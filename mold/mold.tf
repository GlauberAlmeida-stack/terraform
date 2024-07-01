variable "dbname" {
    type = string
  
}

variable "webname" {
    type = string
  
}

variable "ec2type2" {
    type = string
  
}

variable "typeinstance" {
    type = string
  
}

resource "aws_instance" "db" {
    ami = var.ec2type2
    instance_type = var.typeinstance
    security_groups = [aws_security_group.web_traffic_challenge3.name]
    key_name = "userec2"
    
    tags = {
        Name = var.dbname
    }
}

resource "aws_instance" "web" {
    ami = var.ec2type2
    instance_type = var.typeinstance
    security_groups = [aws_security_group.web_traffic_challenge3.name]
    user_data = file("server-script.sh")
    key_name = "userec2"

    tags = {
        Name = var.webname
    }
}

resource "aws_eip" "web_ip" {
    instance = aws_instance.web.id
}

variable "ingress" {
    type = list(number)
    default = [22,80,443,1433,135,1434]
}

variable "egress" {
    type = list(number)
    default = [80,443,25,3306,53,8080,22,1433,1434,135]
}

resource "aws_security_group" "web_traffic_challenge3" {
    name = "My Data Base and Web Severs"
    tags = {
        Name = "SG BD_Servers and Web_Servers"

    }

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress
        content {
            from_port = port.value
            to_port = port. value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

        dynamic "egress" {
        iterator = port
        for_each = var.egress
        content {
            from_port = port.value
            to_port = port. value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

output "PrivateIP" {
    value = aws_instance.db.private_ip
}

output "PublicIP" {
    value = aws_eip.web_ip.public_ip
}
