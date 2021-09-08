resource "aws_eks_cluster" "k8s" {
  name                      = join("", [var.user_name, "-", "eks", "-", random_string.cluster_id.result])
  role_arn                  = aws_iam_role.eks_cluster_role.arn
  enabled_cluster_log_types = ["api", "audit", "authenticator", "scheduler"]
  vpc_config {
    subnet_ids              = [aws_subnet.sub_pub_1.id, aws_subnet.sub_pub_2.id, aws_subnet.sub_pub_3.id, aws_subnet.sub_priv_1.id, aws_subnet.sub_priv_2.id, aws_subnet.sub_priv_3.id]
    security_group_ids      = [aws_security_group.control_plane_sg.id]
    endpoint_private_access = true
  }
  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy, aws_iam_role_policy_attachment.eks_cluster_vpc_policy, aws_iam_role_policy_attachment.eks_cluster_elb, aws_cloudwatch_log_group.cluster_logs]
}