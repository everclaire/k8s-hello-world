resource "aws_nat_gateway" "k8s" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.sub_pub_1.id
  tags = {
    Name = join("", [var.user_name, "eks-ngw"])
  }
}