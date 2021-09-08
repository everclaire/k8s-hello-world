resource "aws_iam_role" "eks_cluster_role" {
  name               = join("", [var.user_name, "eks-helloworld-cluster-role"])
  assume_role_policy = file("roles/EKSClusterServiceRole.json")
}

resource "aws_iam_role" "eks_nodegroup_role" {
  name               = join("", [var.user_name, "eks-helloworld-nodegroup-role"])
  assume_role_policy = file("roles/EKSNodeGroupRole.json")
}