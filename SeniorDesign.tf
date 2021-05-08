# Have to put US East, since it seems that is all educate has access to
provider "aws" {
    profile = "default"
    region = "us-east-1"
    shared_credentials_file = "C:/Users/KyleA/.aws/credentials"
}

# Create RocketChat Instance
resource "aws_instance" "RCHost" {
  ami           = "ami-013f17f36f8b1fefb"
  instance_type = "t2.medium"
  associate_public_ip_address  = true
  user_data = "${file("C:/Users/KyleA/Downloads/launch_setup.sh")}"
}

# Create access key pair
resource "aws_key_pair" "deployer" {
  key_name   = "marshall.pem"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4q8eink4raY/9/6AbHLtmmS7V2wIj1mJwJeEbRBUIpD8j8AOyyGRXj8cVwojnb8A6SL/Y1Drwskjn4F23cyTcn0RXY+39KfGPamy5hGWYyNj2PreHHqy7IpFAvskeXEtdpNIdcwVJd1Up02/w8/yMNLGz0Ya+YpzKFcXm05NbQQRAv9fMcThBcUT3+Q6uACv9zYQmPtu2Tq8xlXEHlFm6noK/j9iOolvltVaaTHGvLJNFpoJosi9me1bHQLwCjFFEIwJysiJGQbhS2kATWXwI/yffoEulGIdyXennzTaLXBde6UGQ3+xKMyUTHVRe/lO5a9jxAGglCEi/QO66BxQWYWMudfczWaHU/unV2l6diPUYn9G1bFIk1AaKsc2D9qBYk1lBG7naSyjHk1mtK+csKy1i12PfdcS92KZW+kqbmdPDy3AATO0c2g+aoNTbyn/qvbeNo/mepxhPvAaieUX7YaiuyTdYl+6jfxUBu5NX37vlr/1m2RihjKTp/Hduno0= KyleA@DESKTOP-K5PTNP9"
}

# resource block for eip #
resource "aws_eip" "RCeip" {
  vpc      = true
}

# resource block for ec2 and eip association #
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.RCHost.id
  allocation_id = aws_eip.RCeip.id
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

  ingress {
    description = "Marshall SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "104.35.82.154/32"
    ]
  }

  ingress {
    description = "David SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "23.240.208.179/32"
    ]
  }

  ingress {
    description = "Oliver SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "172.98.87.146/32"
    ]
  }

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

  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = [
     "0.0.0.0/0"
     ]
 }
} 