resource "aws_launch_template" "k8s_node_group" {
  name = join("", [var.user_name, "-", "eks", "-", random_string.cluster_id.result])
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 80
      volume_type = "gp3"
      iops        = 3000
      throughput  = 125
    }

  }
  vpc_security_group_ids = [aws_security_group.cluster_shared_node.id]

  metadata_options {
    http_tokens                 = "optional"
    http_put_response_hop_limit = 2
    http_endpoint               = "enabled"
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "Name"                           = join("", [var.user_name, "-", "ng", "-", random_string.cluster_id.result, "-", "Node"])
      "alpha.eksctl.io/nodegroup-name" = join("", [var.user_name, "-", "ng", "-", random_string.cluster_id.result])
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "Name"                           = join("", [var.user_name, "-", "ng", "-", random_string.cluster_id.result, "-", "Node"])
      "alpha.eksctl.io/nodegroup-name" = join("", [var.user_name, "-", "ng", "-", random_string.cluster_id.result])
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }
  tag_specifications {
    resource_type = "network-interface"
    tags = {
      "Name"                           = join("", [var.user_name, "-", "ng", "-", random_string.cluster_id.result, "-", "Node"])
      "alpha.eksctl.io/nodegroup-name" = join("", [var.user_name, "-", "ng", "-", random_string.cluster_id.result])
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }
  #user_data = filebase64("cloud-init/node.yml")

}