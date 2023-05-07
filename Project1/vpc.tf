module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"
  
  name = "Project_VPC"
  cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.4.0/24", "10.0.6.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Environment = "test"
    name = "SSJ2_VPC"
  }

}
