resource "aws_iam_policy" "eks_cluster_cloudwatch_metrics" {
  name        = join("", [var.user_name, "eks-helloworld-put-cloudwatch-metrics"])
  path        = "/"
  description = "Allow EKS to manage put metrics to CloudWatch"
  policy      = file("policies/cloudwatch_metrics.json")
}

resource "aws_iam_policy" "eks_cluster_elb_permissions" {
  name        = join("", [var.user_name, "eks-elb-permissions"])
  path        = "/"
  description = "Allow EKS to manage ELBs"
  policy      = file("policies/elb_permissions.json")
}
## AWS Roles
### EKS Cluster policies
data "aws_iam_policy" "aws_eks_cluster_policy" {
  name = "AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "aws_eks_vpc_policy" {
  name = "AmazonEKSVPCResourceController"
}

### EKS Node policies
data "aws_iam_policy" "aws_eks_worker_node_policy" {
  name = "AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "aws_eks_container_registry_policy" {
  name = "AmazonEC2ContainerRegistryReadOnly"
}

data "aws_iam_policy" "aws_eks_cni_policy" {
  name = "AmazonEKS_CNI_Policy"
}