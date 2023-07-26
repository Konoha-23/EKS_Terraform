resource "kubernetes_persistent_volume_claim_v1" "mongo-pvc" {
  metadata {
    name = "mongo-pvc"
  }
  spec {
    storage_class_name = "mongo-sc"
    #volume_name = ""
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "8Gi"
      }
    }
  }
}
