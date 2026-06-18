module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "20.37.2"

  cluster_name    = var.cluster_name
  cluster_version = "1.30"

  cluster_endpoint_public_access = true

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.private_subnets

  enable_cluster_creator_admin_permissions = true

  enable_irsa = true

  eks_managed_node_groups = {

    default = {

      desired_size = 4
      min_size     = 2
      max_size     = 5

      instance_types = ["t3.small"]

      capacity_type = "ON_DEMAND"
    }
  }

  tags = {
    Environment = "dev"
  }
}