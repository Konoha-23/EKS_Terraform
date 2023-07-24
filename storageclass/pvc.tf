resource "kubernetes_persistent_volume_claim_v1" "ebs-pvc" {
  metadata {
    name = "ebs-pvc"
    namespace = "monitor"
  }
  spec {
    storage_class_name = "${kubernetes_storage_class.ebs-sc.metadata.0.name}"
    #volume_name = ""
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}
