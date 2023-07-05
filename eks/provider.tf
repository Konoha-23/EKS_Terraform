---
#Latest Version as of 06/27/23
Terraform Kubernetes Provider reference: https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
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

provider "aws" {
    region = "us-east-2"
}




