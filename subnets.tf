resource "aws_subnet" "sub_pub_1" {
  vpc_id                  = aws_vpc.k8s.id
  cidr_block              = var.vpc_subnet_cidr_blocks["pub_1"]
  availability_zone       = join("", [var.region, "a"])
  map_public_ip_on_launch = true
  tags = {
    Name = join("", [var.user_name, "-", "sub_pub_1"])
  }
}

resource "aws_subnet" "sub_pub_2" {
  vpc_id                  = aws_vpc.k8s.id
  cidr_block              = var.vpc_subnet_cidr_blocks["pub_2"]
  availability_zone       = join("", [var.region, "b"])
  map_public_ip_on_launch = true
  tags = {
    Name = join("", [var.user_name, "-", "sub_pub_2"])
  }
}

resource "aws_subnet" "sub_pub_3" {
  vpc_id                  = aws_vpc.k8s.id
  cidr_block              = var.vpc_subnet_cidr_blocks["pub_3"]
  availability_zone       = join("", [var.region, "c"])
  map_public_ip_on_launch = true
  tags = {
    Name = join("", [var.user_name, "-", "sub_pub_3"])
  }
}

resource "aws_subnet" "sub_priv_1" {
  vpc_id            = aws_vpc.k8s.id
  cidr_block        = var.vpc_subnet_cidr_blocks["priv_1"]
  availability_zone = join("", [var.region, "a"])
  tags = {
    Name = join("", [var.user_name, "-", "sub_priv_1"])
  }
}

resource "aws_subnet" "sub_priv_2" {
  vpc_id            = aws_vpc.k8s.id
  cidr_block        = var.vpc_subnet_cidr_blocks["priv_2"]
  availability_zone = join("", [var.region, "b"])
  tags = {
    Name = join("", [var.user_name, "-", "sub_priv_2"])
  }
}

resource "aws_subnet" "sub_priv_3" {
  vpc_id            = aws_vpc.k8s.id
  cidr_block        = var.vpc_subnet_cidr_blocks["priv_3"]
  availability_zone = join("", [var.region, "c"])
  tags = {
    Name = join("", [var.user_name, "-", "sub_priv_3"])
  }
}