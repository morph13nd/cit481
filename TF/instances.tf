resource "aws_instance" "rocket-chat-instance" {
    ami = "ami-0747bdcabd34c712a"
    instance_type = "t2.medium"


    vpc_security_group_ids = [aws_security_group.rocketchat-host-sg.id]
    subnet_id = aws_subnet.public-subnet-1.id
    private_ip = "10.0.0.5"
    key_name = "marshall"

    tags = {
      Name = "RC-Server"
    }




}

resource "aws_instance" "ssh-bastion-instance" {
    ami = "ami-0747bdcabd34c712a"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.SSH_Bastion_SG.id]
    subnet_id = aws_subnet.public-subnet-1.id
    private_ip = "10.0.0.4"
    key_name = "marshall"

    tags = {
      Name = "SSH Bastion"
    }

}

resource "aws_instance" "grafana-instance" {
    ami = "ami-0747bdcabd34c712a"
    instance_type = "t2.micro"

    vpc_security_group_ids = [aws_security_group.Grafana_SG.id]
    subnet_id = aws_subnet.public-subnet-1.id
    private_ip = "10.0.0.6"
    key_name = "marshall"

    tags = {
      Name = "Grafana Server"
    }

}

resource "aws_instance" "prometheus-instance" {
    ami = "ami-0747bdcabd34c712a"
    instance_type = "t2.micro"

    vpc_security_group_ids = [aws_security_group.Prometheus_SG.id]
    subnet_id = aws_subnet.private-subnet-1.id
    private_ip = "10.0.1.4"
    key_name = "marshall"

    tags = {
      Name = "Prometheus Server"
    }

}
