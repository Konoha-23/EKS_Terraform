#Ref: https://developer.hashicorp.com/terraform/tutorials/kubernetes/helm-provider
===
resource "helm_release" "prometheus" {
  name       = "prometheus"
  create_namespace = true
  namespace  = "apm"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"

  values = [
    "${file("values.yaml")}"
  ]
}

#Ref: https://developer.hashicorp.com/terraform/tutorials/kubernetes/helm-provider
===
resource "helm_release" "grafana" {
  name       = "grafana"
  create_namespace = true
  namespace  = "visual"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
}

NOTES:
1. Get your 'admin' user password by running:

    username = admin
   password = kubectl get secret --namespace apm grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: apmingress
  namespace: apm  
spec:
  ingressClassName: nginx
  rules:
  - host: prometheus.dominionapps.net
    http:
      paths:
      - pathType: Prefix
        path: /
        backend:
          service:
            name: prometheus-server
            port:
              number: 80
  - host: alert.dominionapps.net
    http:
      paths:
      - pathType: Prefix
        path: /
        backend:
          service:
            name: prometheus-alertmanager
            port:
              number: 80
  - host: grafana.dominionapps.net
    http:
      paths:
      - pathType: Prefix
        path: /
        backend:
          service:
            name: grafana
            port:
              number: 80
---
monitoring (micro-service) applications with  
Prometheus and Grafana
======================================
deploy prometheus using helm:
  https://github.com/myLandmakTechnology/prometheus-grafana-ELK-EFK
kubectl create ns apm
      #https://charts.helm.sh/stable - old version deprecated but used during class video
new chart: helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
  
  kubectl config set-context <context_name> -- namespace=<ns_name> #Change default namespace
  kubectl config set-context current --namespace=apm 
  kubectl config set-context --current --ns=dev
  kubectl config set-context --current --ns=apm
 
helm repo add apm https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus apm/prometheus -f prometheus-value.yml -n apm
kubectl get pod -n apm
kubectl get all -n apm

install grafana repo using helm:
helm repo add visual https://grafana.github.io/helm-charts
helm repo update
deploy grafana using helm:
helm install grafana  visual/grafana -n apm







