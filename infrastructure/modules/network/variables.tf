variable "vpc_name" {
  type        = string
  description = "VPC Name"
  default     = "vpc"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR Block"
  default     = "10.0.0.0/16"
}

variable "vpc_availability_zones" {
  type        = list(string)
  description = "VPC Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "VPC Public Subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "VPC Private Subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  type        = bool
  description = "Outbound connection for private Subnets"
  default     = true
}

variable "tags" {}
