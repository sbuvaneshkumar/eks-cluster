variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "kube"
}

variable "cluster_ip_family" {
  type        = string
  description = "IP version"
  default     = "ipv4"
}

variable "cluster_service_ipv4_cidr" {
  type        = string
  description = "The CIDR block to assign for Kubernetes service"
  default     = "172.20.0.0/16"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes cluster version to use for the EKS cluster"
  default     = "1.21"
}

variable "vpc_id" {}
variable "private_subnets" {}
variable "tags" {}
variable "eks_managed_node_groups" {
  type = map(object({
    min_size              = number
    max_size              = number
    desired_size          = number
    instance_types        = list(string)
    capacity_type         = string
    labels                = map(string)
    update_config_max_ava = number
  }))
  description = "Managed node group information"
  default = {
    "devtools" = {
      min_size       = 1
      max_size       = 10
      desired_size   = 3
      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"
      labels = {
        Environment = "test"
        GithubRepo  = "terraform-aws-eks"
        GithubOrg   = "terraform-aws-modules"
      }
      update_config_max_ava = 50
    }
  }
}
