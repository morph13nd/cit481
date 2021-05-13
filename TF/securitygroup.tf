#ROCKETCHAT WEB TRAFFIC
resource "aws_security_group" "RocketChat_Host_SG" {
  name        = "RC_Host"
  description = "Rocket.Chat Rules"

  ingress {
    description = "HTTP IN"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ingress {
    description = "HTTPS IN"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

#Allow SSH from SSH Bastion
  ingress {
    description = "SSH IN"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["10.0.0.2/32"]
}

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }

  ingress {
    from_port = 9090
    to_port = 9090
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
   }

   ingress {
     from_port = 9100
     to_port = 9100
     protocol = "tcp"
     cidr_blocks = ["10.0.0.0/16"]
   }

   ingress {
     from_port = 9093
     to_port = 9093
     protocol = "tcp"
     cidr_blocks = ["10.0.0.0/16"]
   }



}

#SSH BASTION

resource "aws_security_group" "SSH_Bastion_SG" {
  name = "SSH_Bastion"
  description = "Jumpbox Config"

  ingress {
    description = "Admin SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["23.240.208.179/32"]
  }

  ingress {
    description = "Marshall SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["104.35.82.154/32"]
  }

  ingress {
    description = "David SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["23.240.208.179/32"]
  }

  ingress {
    description = "Oliver SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.98.87.146/32"]
  }

  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

#GRAFANA WEB ACCESS

resource "aws_security_group" "Grafana_SG" {
  name = "Grafana"
  description = "Grafana server for web access"

  #OPEN ONLY TO GROUP MEMBER IP'S

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["10.0.0.2/24"]
  }

  ingress {
    description = "Oliver HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["172.98.87.146/32"]
  }

  ingress {
    description = "David HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["23.240.208.179/32"]
  }

  ingress {
    description = "Admin HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["23.240.208.179/32"]
  }

  ingress {
    description = "Marshall HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["104.35.82.154/32"]
  }

  ingress {
    description = "Grafana_App"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "SSH From Bastion"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["10.0.0.2/32"]
  }

  ingress {
    description = "Prometheus"
    from_port = 9090
    to_port = 9090
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "Node"
    from_port = 9100
    to_port = 9100
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "Alert Manager"
    from_port = 9093
    to_port = 9093
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

#PROMETHEUS

resource "aws_security_group" "Prometheus_SG" {
    name = "Prometheus"
    description = "Prometheus in Private Sub"

    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["10.0.0.2/24"]
    }

    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }

    ingress {
      from_port = 9090
      to_port = 9090
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }

    ingress {
      from_port = 9093
      to_port = 9093
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }

    ingress {
      from_port = 9100
      to_port = 9100
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }

    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["10.0.0.2/24"]
    }

    egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }


}
