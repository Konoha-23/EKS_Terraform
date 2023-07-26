resource "helm_release" "mongo" {
  name       = "mongo"
  namespace  = "default"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mongodb"

  values = [
    "${file("mongo_values.yml")}"
  ]
}
