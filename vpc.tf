resource "aws_vpc" "k8s" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = join("", [var.user_name, "-", "eks-vpc"])
  }
}