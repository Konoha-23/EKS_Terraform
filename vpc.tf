#EKS VPC And Subnet Ref: https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html
#Ref for public and private tagging rules tied to alb controller: https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.4/deploy/subnet_discovery/
#Important Security Group Requirements: https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html
#vpc - (Optional Deprecated) Boolean if the EIP is in a VPC or not. Use domain instead. Defaults to true unless the region supports EC2-Classic. Warning comes up 
#when running this module as of 06/06/23 so need to change "vpc = true" to "domain   = "vpc" " in the main.tf file line 1032. 

Example 1 (EKS VPC):

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
    "kubernetes.io/cluster/$(var.cluster_name}" = "shared"
    "kubernetes.io/role/elb" = 1 #Necessary for load balancer
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/$(var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = 1 #Necessary for Load Balancer
  }
}
  
Example 2 (Non-EKS VPC):
    
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "Practice_vpc"
  cidr = "10.0.0.0/16"
  azs = ["us-east-1a", "us-east-1b","us-east-1d", "us-east-1f"]
  
  private_subnet_names = ["Practice_Private_Subnet_1", "Practice_Private_Subnet_2"]
  private_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
  
  public_subnet_names = ["Practice_Public_Subnet_1", "Practice_Public_Subnet_2"]
  public_subnets = ["10.0.3.0/24","10.0.4.0/24"]
  map_public_ip_on_launch = true
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    terraform = "true"
    environment = "dev"
  }
  

}
