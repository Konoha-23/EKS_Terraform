resource "helm_release" "prometheus" {
  name       = "prometheus"
  create_namespace = true
  namespace  = "monitor"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus" #After add repository with helm repo add. so try that if it does not run automatically

   values = [
    "${file("prom-values.yml")}"
  ]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  create_namespace = true
  namespace  = "monitor"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
}
