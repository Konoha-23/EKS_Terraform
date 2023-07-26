resource "helm_release" "elastic" {
  name       = "elastic"
  create_namespace = true
  namespace  = "logs"
  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"

  values = [
    "${file("elastic.yml")}"
  ]
}

resource "helm_release" "kibana" {
  name       = "kibana"
  create_namespace = true
  namespace  = "logs"
  repository = "https://helm.elastic.co"
  chart      = "kibana"
}

resource "helm_release" "logstash" {
  name       = "logstash"
  create_namespace = true
  namespace  = "logs"
  repository = "https://helm.elastic.co"
  chart      = "logstash"
}
