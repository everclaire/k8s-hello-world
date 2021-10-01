resource "aws_internet_gateway" "k8s" {
  vpc_id = aws_vpc.k8s.id
  tags = {
    Name = join("", [var.user_name, "eks-igw"])
  }
}