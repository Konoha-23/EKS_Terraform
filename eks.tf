module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.13.1"

  cluster_name = "SSJ"
  cluster_version = "1.25"
  cluster_endpoint_public_access = true
  enable_irsa = true
  cluster_addons = {
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    Goku = {
      instance_types = ["t2.medium", "t2.medium", "t2.medium", "t2.medium"]
      min_size = 2
      desired_size = 2
      max_size = 4

      use_custom_launch_template = false
      remote_access = {
        ec2_ssh_key = "EKS"
      }
      disk_size = 20
      ebs_optimized = true
      enable_monitoring = true

    }
  }


  tags = {
    name = "kubernetes.io/cluster/SSJ"
  }
}
