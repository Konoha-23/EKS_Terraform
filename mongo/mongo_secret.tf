resource "kubernetes_secret_v1" "mongo-secret" {
  metadata {
    name = "mongo-secret"
  }

  data = {
    mongodb-root-password = "Arsenal23"
  }

  type = "Opaque"
}
