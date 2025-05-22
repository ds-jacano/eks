module "vpc_eks" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.18.1"

  name = var.name_prefix

  azs = var.azs

  cidr            = var.vpc_cidr
  public_subnets  = var.public_subnets_cidrs

  enable_nat_gateway     = false
  enable_vpn_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    "kubernetes.io/role/elb"              = "1",
    "kubernetes.io/role/internal-elb"     = "1",
    "mapPublicIpOnLaunch"                 = "TRUE",
    "karpenter.sh/discovery"              = var.name_prefix
  }

  tags = {
    "kubernetes.io/cluster/${var.name_prefix}" = "shared"
  }
}

#####
# Outputs
#####
output "vpc_id" {
  value       = module.vpc_eks.vpc_id
  description = "VPC ID."
}

output "public_subnet_ids" {
  value       = module.vpc_eks.public_subnets
  description = "Public subnet IDs."
}
