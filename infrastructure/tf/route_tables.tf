## Public subnet route
resource "aws_route_table" "igw" {
  vpc_id = aws_vpc.k8s.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s.id
  }
}

## Private subnet route
resource "aws_route_table" "ngw" {
  vpc_id = aws_vpc.k8s.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.k8s.id
  }
}