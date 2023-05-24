ref: https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
ref: https://github.com/terraform-aws-modules/terraform-aws-security-group/tree/master/examples/http
List of Security Groups implemented as Terraform modules: https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/modules/README.md
#rules - Map of known security group rules (define as 'name' = ['from port', 'to port', 'protocol', 'description']). 

Security group with predefined rules

module "ssh_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 4.0"

  name = "http-sg"
  vpc_id = ""
}

module "http_80_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 4.0"

  name = "http-sg"
  vpc_id = ""
}
  
module "https_443_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/https-443"
  version = "~> 4.0"

  name = "https-sg"
  vpc_id = ""
}
  
module "mysql_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/mysql"
  version = "~> 4.0"

  name = "mysql-sg"
  vpc_id = ""
}

module "elasticsearch_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/elasticsearch"
  version = "~> 4.0"

  name = "elasticsearch-sg"
  vpc_id = ""
}
  
module "kibana_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/kibana"
  version = "~> 4.0"

  name = "kibana-sg"
  vpc_id = ""
}
  
module "prometheus_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/prometheus"
  version = "~> 4.0"

   name = "prometheus-sg"
  vpc_id = ""
}
  
Security group with custom rules
  
module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name = "All-sg"
  vpc_id = ""
  
  rules = {
  "all-all": [
    -1,
    -1,
    "-1",
    "All protocols"
  ],  
  "http-80-tcp": [
       80,
       80,
       "tcp",
       "HTTP"
  ],
  "http-8080-tcp": [
     8080,
     8080,
     "tcp",
     "HTTP"
  ],
  "https-443-tcp": [
     443,
     443,
     "tcp",
     "HTTPS"
  ],
  "kibana-tcp": [
     5601,
     5601,
     "tcp",
     "Kibana Web Interface"
  ],
  "elasticsearch-java-tcp": [
     9300,
     9300,
     "tcp",
     "Elasticsearch Java interface"
   ],
  "mongodb-27017-tcp": [
     27017,
     27017,
     "tcp",
     "MongoDB"
  ],
  "kubernetes-api-tcp": [
     6443,
     6443,
     "tcp",
     "Kubernetes API Server"
  ],
  "mysql-tcp": [
     3306,
     3306,
     "tcp",
     "MySQL/Aurora"
  ],
  "prometheus-http-tcp": [
     9090,
     9090,
     "tcp",
     "Prometheus"
  ],
  "prometheus-node-exporter-http-tcp": [
     9100,
     9100,
     "tcp",
     "Prometheus Node Exporter"
  ],
  "prometheus-pushgateway-http-tcp": [
     9091,
     9091,
     "tcp",
     "Prometheus Pushgateway"
  ],
    
 }
}
