#Important Security Group Requirements: https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html
#EKS VPC And Subnet Ref: https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html
#Ref for public and private tagging rules tied to alb controller: https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.4/deploy/subnet_discovery/
#Addons Version Ref: https://docs.aws.amazon.com/eks/latest/userguide/service-accounts.html#boundserviceaccounttoken-validated-add-on-versions

---
#Latest version as of 06/19/23
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.13.1"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  enable_irsa = true
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  cluster_endpoint_public_access = true
  cluster_additional_security_group_ids = [module.SSJ2_cluster_additional_security_group.security_group_id]

  eks_managed_node_groups = {
    Goku = {
      instance_types = var.instance_types
      node_security_group_additional_rules = {
        source_cluster_security_group = true
      }
      min_size = 2
      desired_size = 2
      max_size = 4

      use_custom_launch_template = false
      remote_access = {
        ec2_ssh_key = var.key_name
      }
      disk_size = 20
      ebs_optimized = true
      enable_monitoring = true
      update_config = {
          max_unavailable = 1
        }

    }
  }
  tags = {
    name = "kubernetes.io/cluster/SSJ2"
  }
}
---
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.13.1"

  cluster_name = "SSJ"
  cluster_version = "1.25"
  cluster_endpoint_public_access = true
  enable_irsa = true
  cluster_addons = {
    coredns = {
      most_recent = true
    }
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
