provider "aws" {
  region = "us-west-2" 
}

module "my_vpc" {
  source = "terraform-aws-modules/vpc/aws"
}

module "my_eks_cluster" {
  source       = "./modules/my_eks_cluster"
  vpc_id       = module.my_vpc.vpc_id
  cluster_name = "my-eks-cluster"
}
