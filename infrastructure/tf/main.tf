provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Manager = "Terraform"
      Creator = "Claire B"
    }
  }
}

provider "kubernetes" {
  host                   = aws_eks_cluster.k8s.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.k8s.certificate_authority[0].data)
  exec {
    api_version = var.api_version
    args        = ["eks", "get-token", "--cluster-name", join("", [var.user_name, "-", "eks", "-", random_string.cluster_id.result])]
    command     = "aws"
  }
}

resource "random_string" "cluster_id" {
  length      = 6
  lower       = true
  min_numeric = 2
  min_lower   = 4
  special     = false
}