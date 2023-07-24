resource "kubernetes_ingress_v1" "nginx-ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "nginx-ingress"
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      host = "nginx.devopsnetwork.net"
      http {
        path {
          path_type = "Prefix"
          path = "/*"
          backend {
            service {
              name = "nginx-svc"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
