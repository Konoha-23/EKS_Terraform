resource "helm_release" "nginx" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
}

#Update as of 10/15/23
#https://artifacthub.io/packages/helm/ingress-nginx/ingress-nginx
#https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx

---
resource "helm_release" "nginx" {
  name       = "nginx-ingress"
  create_namespace = true
  namespace  = "nginx"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
}
