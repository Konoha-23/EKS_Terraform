#Ref: https://developer.hashicorp.com/terraform/tutorials/kubernetes/helm-provider
===
resource "helm_release" "nginx" {
  name       = "nginx-ingress"
  create_namespace = true
  namespace  = "nginx"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
}

---
#Instructions for installing nginx ingress controller
Deploying 3rd party applications using Helm   
Install Nginx ingress using helm:  
===============================
 https://helm.nginx.com/stable
 helm repo add nginx-ingress https://helm.nginx.com/stable 
 helm repo update
 helm search repo nginx-ingress     
 helm install  nginx    nginx-ingress/nginx-ingress -n nginx


