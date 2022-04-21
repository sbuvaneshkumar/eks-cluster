variable "aws_region" {
  type        = string
  description = "Region in which AWS Resources to be created"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Environment Variable used as a prefix"
  default     = "dev"
}

variable "business_divsion" {
  type        = string
  description = "Name of the team"
  default     = "devtools"
}

# ------ VPC ------ #
variable "vpc_name" {
  type        = string
  description = "VPC Name"
  default     = "vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR Block"
  default     = "10.0.0.0/16"
}

# ------ EKS ------ #
variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "kube"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes cluster version to use for the EKS cluster"
  default     = "1.21"
}

variable "node_groups" {
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
      min_size       = 2
      max_size       = 3
      desired_size   = 2
      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"
      labels = {
        Environment = "dev"
        GithubRepo  = "terraform-aws-eks"
        GithubOrg   = "terraform-aws-modules"
      }
      update_config_max_ava = 50
    }
  }
}
