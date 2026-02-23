module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "terra-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  map_public_ip_on_launch = true

public_subnet_tags = {
  "kubernetes.io/cluster/terra-eks" = "shared"
  "kubernetes.io/role/elb" = "1"
}

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "terra-eks"
  kubernetes_version = "1.29"

  addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

endpoint_public_access = true
enable_cluster_creator_admin_permissions = true

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }

   eks_managed_node_groups = {
    default = {
      instance_types = ["t3.xlarge"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1
    }
   }
}
