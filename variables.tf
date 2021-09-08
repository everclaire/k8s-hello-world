variable "region" {
  default = "us-west-2"
}

variable "vpc_cidr_block" {
  default = "10.14.0.0/16"
}

variable "user_name" {
  default = "cbeamer"
}

variable "eks_instance_type" {
  default = "m5.large"
}
variable "ssh_pub_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK3GG+lA6Wm7XOk0hEgsip7qyNii/FWNO1YIlutbo4nA cbeamer@claire.beamer-mbp"
}

variable "vpc_subnet_cidr_blocks" {
  default = {
    pub_1  = "10.14.0.0/24",
    pub_2  = "10.14.1.0/24",
    pub_3  = "10.14.2.0/24"
    priv_1 = "10.14.3.0/24",
    priv_2 = "10.14.4.0/24",
    priv_3 = "10.14.5.0/24"
  }
}

## K8s variables
variable "api_version" {
  default = "client.authentication.k8s.io/v1alpha1"
}
variable "deploy_image" {
  default = "gcr.io/kuar-demo/kuard-amd64:blue"
}