## EKS cluster role policy attachments
resource "aws_iam_role_policy_attachment" "eks_cluster_cloudwatch" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = aws_iam_policy.eks_cluster_cloudwatch_metrics.arn
}

resource "aws_iam_role_policy_attachment" "eks_cluster_elb" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = aws_iam_policy.eks_cluster_elb_permissions.arn
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = data.aws_iam_policy.aws_eks_cluster_policy.arn
}

resource "aws_iam_role_policy_attachment" "eks_cluster_vpc_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = data.aws_iam_policy.aws_eks_vpc_policy.arn
}

## EKS NodeGroup role policy attachments
resource "aws_iam_role_policy_attachment" "eks_worker_node" {
  role       = aws_iam_role.eks_nodegroup_role.name
  policy_arn = data.aws_iam_policy.aws_eks_worker_node_policy.arn
}

resource "aws_iam_role_policy_attachment" "eks_container_registry" {
  role       = aws_iam_role.eks_nodegroup_role.name
  policy_arn = data.aws_iam_policy.aws_eks_container_registry_policy.arn
}

resource "aws_iam_role_policy_attachment" "aws_eks_cni_policy" {
  role       = aws_iam_role.eks_nodegroup_role.name
  policy_arn = data.aws_iam_policy.aws_eks_cni_policy.arn
}