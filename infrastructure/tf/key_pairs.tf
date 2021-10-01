# resource "aws_key_pair" "eks_user" {
#   key_name   = join("", [var.user_name, "-", "eks-ssh-key", "-", random_string.nodegroup_id.result])
#   public_key = var.ssh_pub_key
# }