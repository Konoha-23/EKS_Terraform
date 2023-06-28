---
#Latest Version as of 06/19/23
@Allows you to create an EKS cluster with Helm enabled to install 3rd party packages as add-ons such as Nginx Ingress Controller, Prometheus, etc...
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

provider "aws" {
    region = "us-east-2"
}

provider "kubernetes" {
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
  }
}

data "aws_caller_identity" "current" {}

provider "aws" {
    region = "us-east-1"
}

ç#Ref: https://developer.hashicorp.com/terraform/tutorials/kubernetes/helm-provider


