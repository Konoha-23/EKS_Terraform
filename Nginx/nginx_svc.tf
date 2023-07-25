resource "kubernetes_service_v1" "nginx-svc" {
  metadata {
    name = "nginx-svc"
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
