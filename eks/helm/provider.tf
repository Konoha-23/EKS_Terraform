Terraform Helm Provider Ref: https://registry.terraform.io/providers/hashicorp/helm/latest/docs

---

terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4.1"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
      command     = "aws"
    }
  }
}

---
#With This Setup, kubeconfig needs to have been updated after creating the cluster with the kubernetes provider using the command
#aws eks update-kubeconfig --name SSJ3 --region us-east-2a

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
