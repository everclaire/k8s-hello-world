output "eks_cluster_name" {
  value = join("", [var.user_name, "-", "eks", "-", random_string.cluster_id.result])
}
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.k8s.endpoint
}