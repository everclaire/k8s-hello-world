## Allow communication between control plane and worker nodes
resource "aws_security_group" "control_plane_sg" {
  name        = join("", [var.user_name, "-", "eks-control-plane-sg", "-", random_string.cluster_id.result])
  description = "Security Group for K8s control plane"
  vpc_id      = aws_vpc.k8s.id
  ingress {
    description = "Allow all nodes to communicate with the cluster"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.sub_priv_1.cidr_block,
      aws_subnet.sub_priv_2.cidr_block,
      aws_subnet.sub_priv_3.cidr_block,
      aws_subnet.sub_pub_1.cidr_block,
      aws_subnet.sub_pub_2.cidr_block,
      aws_subnet.sub_pub_3.cidr_block,
    "127.0.0.1/32"]
  }
  egress {
    description = "Allow egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
## Communication between nodes in cluster
resource "aws_security_group" "cluster_shared_node" {
  name        = join("", [var.user_name, "-", "shared-node-sg", "-", random_string.cluster_id.result])
  description = "Allow nodes to communicate with each other"
  vpc_id      = aws_vpc.k8s.id
  ingress {
    description = "Allow all nodes in this SG to communicate with each other"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.sub_priv_1.cidr_block,
      aws_subnet.sub_priv_2.cidr_block,
      aws_subnet.sub_priv_3.cidr_block,
      aws_subnet.sub_pub_1.cidr_block,
      aws_subnet.sub_pub_2.cidr_block,
      aws_subnet.sub_pub_3.cidr_block,
    "127.0.0.1/32"]
  }
  ingress {
    description = "Allow SSH ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## Allow SSH
resource "aws_security_group" "ssh_sg" {
  name        = join("", [var.user_name, "-", "ssh", "-", "eks-sg"])
  description = "Allow SSH connections"
  vpc_id      = aws_vpc.k8s.id
  ingress {
    description = "Allow SSH connections"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}