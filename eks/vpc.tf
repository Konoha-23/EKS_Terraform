module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"
  
  name = "SSJ4_VPC"
  cidr = "10.0.0.0/16"

  azs = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnet_names = ["Goku_Private4", "Vegeta_Private4"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"] #Recommended for Nodes used ib client application deployment and default for fargate
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"	= 1 #- Kubernetes Tag for internal loadbalance i.e cluster IP
  }

  public_subnet_names = ["Goku_Public4", "Vegeta_Public4"]
  public_subnets = ["10.0.4.0/24", "10.0.6.0/24"] #Necessary for Load Balancer. Also good for deploying Nodes that can host web applications such as Nginx, Prometheus, etc...
  map_public_ip_on_launch = true
  create_igw           = true
  enable_dns_hostnames = true #Required
  enable_dns_support = true #Required
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1 #Kubernetes Tag for load balancer in Public subnet
  }

  tags = {
    name = "kubernetes.io/cluster/SSJ4"
    "kubernetes.io/cluster/SSJ4" =	"owned" #- Kubernetes Tag that states cluster which owns all the resources in this VPC. REQUIRED
    "kubernetes.io/cluster/SSJ4" =	"shared" #- Kubernetes Tag that states cluster which owns all the resources in this VPC. REQUIRED
  }
}
