module "vpc" {
  source = "./modules/network"
  vpc_name = "${local.name}-${var.vpc_name}"
  vpc_cidr_block = var.vpc_cidr
  tags = local.common_tags
}

module "eks" {
  source = "./modules/eks"
  vpc_id = "${module.vpc.vpc_id}"
  private_subnets = "${module.vpc.private_subnets}"
  cluster_name = "${local.name}-${var.cluster_name}"
  cluster_version = var.cluster_version
  eks_managed_node_groups = var.node_groups
  tags = local.common_tags
}
