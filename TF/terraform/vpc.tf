resource "aws_vpc" "rocket-vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    name = "rocket-vpc"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id = aws_vpc.rocket-vpc.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    name = "public-subnet-1"
  }

}

resource "aws_subnet" "private-subnet-1" {
  vpc_id = aws_vpc.rocket-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1a"

  tags = {
    name = "private-subnet-1"
  }


}

resource "aws_internet_gateway" "rocket-vpc-gateway" {
  vpc_id = aws_vpc.rocket-vpc.id

}

resource "aws_route_table" "rocket-vpc-rt" {
  vpc_id = aws_vpc.rocket-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rocket-vpc-gateway.id
  }


}

resource "aws_route_table_association" "rocket-vpc-public-1-assoc" {
  subnet_id = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.rocket-vpc-rt.id
}
