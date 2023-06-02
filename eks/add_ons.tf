# As of practice on 05/12/23 This did not and may require extra configuration for the namespace and/or service account configuration
# Study setup more and corresponding lecture from Prof to confirm. 



module "eks_blueprints_kubernetes_addons" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons"

  eks_cluster_id = module.eks.cluster_name


  #K8s Add-ons
  enable_metrics_server                = true
  enable_prometheus                    = true
  enable_grafana                       = true
}
#enable_ingress_nginx                 = true
#This add-on installs NGINX Ingress Controller on Amazon EKS. NGINX ingress controller is using NGINX as a reverse proxy and load balancer.

#Other than handling Kubernetes ingress objects, this ingress controller can facilitate multi-tenancy and segregation of workload ingresses based on host name (host-based 
#routing) and/or URL Path (path based routing).

#IMPORTANT: This add-on depends on AWS Load Balancer Controller Add-on in order to enable NLB support.

#AWS Load Balancer Controller add-on must be present in add-on array and must be in add-on array before the NGINX ingress controller add-on for it to work, as shown in 
#below example. Otherwise will run into error Assertion failed: Missing a dependency for AwsLoadBalancerControllerAddOn.
