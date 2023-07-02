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

==
#ref: https://catalog.us-east-1.prod.workshops.aws/workshops/31676d37-bbe9-4992-9cd1-ceae13c5116c/en-US/aws-managed-oss/amp/ingest-metrics
resource "helm_release" "prometheus" { #aws_managed_prometheus_service
  name       = "prometheus"
  create_namespace = true
  namespace  = "apm"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "amp-prometheus-chart"

  values = [
    "${file("values.yaml")}"
  ]

  set {
    name  = "server.remoteWrite[0].sigv4.region"
    value = "us-esdt-2"
  }

  set {
    name  = "server.remoteWrite[0].url"
    value = "https://aps-workspaces.${AWS_REGION}.amazonaws.com/workspaces/${WORKSPACE_ID}/api/v1/remote_write" #input workplace I'd after creating workspace I'm AMSP
  }

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
  
  kubectl config set-context <context_name> -- namespace=<ns_name>
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
