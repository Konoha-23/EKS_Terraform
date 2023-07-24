resource "kubernetes_deployment_v1" "nginx-deploy" {
  metadata {
    name = "nginx"
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 2
    strategy {
        type = "RollingUpdate"
        rolling_update {
            max_surge = 3
            max_unavailable = 2
        }
      }
    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "nginx-pod"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = ".5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
