resource "aws_eks_node_group" "k8s" {
  ami_type        = "AL2_x86_64"
  cluster_name    = aws_eks_cluster.k8s.name
  node_group_name = join("", [var.user_name, "-", "ng", "-", random_string.cluster_id.result])
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = [aws_subnet.sub_pub_1.id, aws_subnet.sub_pub_2.id, aws_subnet.sub_pub_3.id, aws_subnet.sub_priv_1.id, aws_subnet.sub_priv_2.id, aws_subnet.sub_priv_3.id]
  instance_types  = [var.eks_instance_type]
  launch_template {
    id      = aws_launch_template.k8s_node_group.id
    version = aws_launch_template.k8s_node_group.latest_version
  }
  scaling_config {
    desired_size = 2
    min_size     = 2
    max_size     = 2
  }
  labels = {
    ## Label must be applied for nodes to converge with control plane
    "alpha.eksctl.io/cluster-name"   = join("", [var.user_name, "-", "eks", "-", random_string.cluster_id.result])
    "alpha.eksctl.io/nodegroup-name" = join("", [var.user_name, "-", "ng", "-", random_string.cluster_id.result])
  }
  depends_on = [aws_eks_cluster.k8s, aws_iam_role_policy_attachment.eks_worker_node, aws_iam_role_policy_attachment.eks_container_registry, aws_iam_role_policy_attachment.aws_eks_cni_policy]
  ## Update our kubeconfig here
  provisioner "local-exec" {
    command = "which aws; aws eks update-kubeconfig --name ${join("", [var.user_name, "-", "eks", "-", random_string.cluster_id.result])} --kubeconfig ~/.kube/helloworld || echo 'Please ensure that the awscli is installed'"
  }
}