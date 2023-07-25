resource "kubernetes_ingress_v1" "prom-ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "prom-ingress"
    namespace  = "monitor"
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      host = "prometheus.devopsnetwork.net"
      http {
        path {
          path_type = "Prefix"
          path = "/*"
          backend {
            service {
              name = "prometheus-server"
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
