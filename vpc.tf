#EKS VPC And Subnet Ref: https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html
#Ref for public and private tagging rules tied to alb controller: https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.4/deploy/subnet_discovery/
#Important Security Group Requirements: https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"
  
  name = "SSJ_VPC"
  cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"] #Recommended for Nodes
  public_subnets = ["10.0.4.0/24", "10.0.6.0/24"] #Necessary for Load Balancer
  map_public_ip_on_launch = true
  
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true #Required
  enable_dns_support = true #Required

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1 #Necessary for load balancer
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1 #Necessary for Load Balancer
  }
}
