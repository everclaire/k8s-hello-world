resource "aws_cloudwatch_log_group" "cluster_logs" {
  name              = join("", ["/aws/eks/", join("", [var.user_name, "-", "eks", "-", random_string.cluster_id.result]), "/", "cluster"])
  retention_in_days = 7
}