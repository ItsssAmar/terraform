variable "vpc_id" {
  description = "ID of the VPC"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}

module "eks_cluster" {
  source   = "terraform-aws-modules/eks/aws"
  cluster_name = var.cluster_name
  subnets      = [var.vpc_id] # Assume all subnets are private
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2
      instance_type    = "t3a.large"
    }
  }
}

output "eks_cluster_id" {
  value = module.eks_cluster.cluster_id
}
