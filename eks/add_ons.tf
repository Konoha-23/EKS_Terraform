# As of practice on 05/12/23 This did not and may require extra configuration for the namespace and/or service account configuration
# Study setup more and corresponding lecture from Prof to confirm. 
#Update 06/16/23 Ref: https://aws.amazon.com/blogs/containers/bootstrapping-clusters-with-eks-blueprints/ #Scroll to using eks blueprints


module "eks_blueprints" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints?ref=v4.0.2"

  # EKS Cluster VPC and Subnet mandatory config
  vpc_id             = <vpc_id>
  private_subnet_ids = <private_subnet_ids>

  # EKS CLUSTER VERSION
  cluster_version = "1.21"

  # EKS MANAGED NODE GROUPS
  managed_node_groups = {
    mg_5 = {
      node_group_name = "managed-ondemand"
      instance_types  = ["t2.medium"]
      min_size        = "2"
    }
  }
}

# Add-ons
module "kubernetes_addons" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons?ref=v4.0.2"

  eks_cluster_id = module.eks_blueprints.eks_cluster_id

  # EKS Add-ons
  enable_amazon_eks_vpc_cni            = true
  enable_amazon_eks_coredns            = true
  enable_amazon_eks_kube_proxy         = true
  enable_amazon_eks_aws_ebs_csi_driver = true

  # Self-managed Add-ons
  enable_aws_for_fluentbit            = true
  enable_aws_load_balancer_controller = true
  enable_aws_efs_csi_driver           = true
  enable_cluster_autoscaler           = true
  enable_metrics_server               = true
}



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
