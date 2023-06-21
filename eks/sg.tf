module "SSJ2_cluster_additional_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name = "SSJ2_cluster_additional_security_group"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"] #This should not be the cidr blocks for the private* subnets of your cluster. 
  #If incorrect cidr block is used, this security group won't be attached to the Managed Node Group.
  
  ingress_rules = ["http-80-tcp", "http-8080-tcp", "https-443-tcp", "kibana-tcp", "elasticsearch-java-tcp", 
                  "mongodb-27017-tcp", "mysql-tcp", "prometheus-http-tcp", "prometheus-node-exporter-http-tcp", 
                  "prometheus-pushgateway-http-tcp"
                  ]
  tags = {
    "name" = "SSJ2_cluster_additional_security_group"
  }
}
