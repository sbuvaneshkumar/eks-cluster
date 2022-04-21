module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.3"
  
  name            = var.vpc_name
  cidr            = var.vpc_cidr_block
  azs             = var.vpc_availability_zones
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags     = var.tags 
  vpc_tags = var.tags

  public_subnet_tags = {
    Name = "Public Subnets"
    "kubernetes.io/role/elb" = 1
  }
  private_subnet_tags = {
    Name = "Private Subnets"
    "kubernetes.io/role/internal-elb" = 1
  }
}
