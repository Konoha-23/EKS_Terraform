resource "helm_release" "nginx" {
  name       = "nginx-ingress"
  create_namespace = true
  namespace  = "nginx"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
}
