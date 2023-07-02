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
