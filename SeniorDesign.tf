# Have to put US East, since it seems that is all educate has access to
provider "aws" {
    profile = "default"
    region = "us-east-1"
    shared_credentials_file = "/home/kallen/.aws/credentials"
}

# Create RocketChat Instance
resource "aws_instance" "ec2-RocketChat-Host" {
  ami           = "ami-013f17f36f8b1fefb"
  instance_type = "t2.medium"
  associate_public_ip_address  = true
  user_data = "${file("C:\Users\KyleA\Downloads\launch_setup.sh")}"
}

# Create access key pair
resource "aws_key_pair" "deployer" {
  key_name   = "RC_Host.pem"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDk9BRmushB5tTFQPneFuP2Iv3wMqLveVGzZQQDotPlxYDc3Yd5bUt0GCUrcduVRznEId7JYa0InoLMKYl04gMicWRgRg1tU4Ch9xmSv/vKz4L5DGYYOkyPV6Sll/uGqaMCEJiuqmhLvuAOFjs5g9YqDQuaZSw7qp+4Xxl71OChCkewdxRxvT0ZW05UgSKChdfntPNu6sS8yMvYmGad1oN6i97pWclB1Y0GHoQrdAvkiTDMmE/TIjZExwOei8BYtIWNHThImI34JJfGy3voPr0M0WC06lt+6dSnx21rfWNK2HNfkRP9p/HdtRafRqELc6RWYdA7PO3awCfpZCK4yRPJvA0JvyTbcy1sDxHw8vtNruv+YuelgMk1Yopc7JH9sX6IWSu5hO0nHqprH7G3mMqKm43qMTmCFgXZHP09VqL43cy3crpCdIjFQdr3D8Gg2TSoUqUKhG+g+PIFukdIklBAwAnnXhoziE9ZSpDb7OBp+lUX6cKvYR6gLpu/fEz0hKU= kallen@BlackPearl"
}

# Security group and rule to allow ssh in
resource "aws_security_group" "RocketChat_Host_SG" {
  name        = "RC_Host"
  description = "SSH/WEB"

  ingress {
    description = "Admin SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "23.240.208.179/32"
    ]
  }
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
} 