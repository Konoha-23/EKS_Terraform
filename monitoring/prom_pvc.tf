resource "kubernetes_persistent_volume_claim_v1" "prom-pvc" {
  metadata {
    name = "prom-pvc"
    namespace = "monitor"
  }
  spec {
    storage_class_name = "prom-sc"
    #volume_name = ""
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}
