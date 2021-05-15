resource "aws_eip" "rocket-vpc-nat" {
  vpc = true
}

resource "aws_nat_gateway" "rocket-vpc-nat-gateway" {
  allocation_id = aws_eip.rocket-vpc-nat.id
  subnet_id = aws_subnet.public-subnet-1.id
  depends_on = [aws_internet_gateway.rocket-vpc-gateway]
}

resource "aws_route_table" "rocket-vpc-private" {
  vpc_id = aws_vpc.rocket-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.rocket-vpc-nat-gateway.id
  }

  tags = {
    Name = "rocket-vpc-private"
  }

}

resource "aws_route_table_association" "rocket-vpc-private-assoc" {
  subnet_id = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.rocket-vpc-private.id
}
