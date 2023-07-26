resource "kubernetes_service_v1" "springapp-svc" {
  metadata {
    name = "springapp-svc"
  }
  spec {
    selector = {
      app = "springapp"
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
