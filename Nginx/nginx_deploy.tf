resource "kubernetes_deployment_v1" "nginx-deploy" {
  metadata {
    name = "nginx"
  }

  spec {
    replicas = 2
    strategy {
        type = "RollingUpdate"
        rolling_update {
            max_surge = 1
            max_unavailable = 1
        }
      }
    min_ready_seconds = 30
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
        volume {
          name = "nginx-html-config"
          config_map {
            name = "nginx-config"
          }
        }
        container {
          image = "nginx:latest"
          name  = "nginx-pod"

          port {
            container_port = 80
          }

          volume_mount {
            mount_path = "/usr/share/nginx/html/"
            name = "nginx-html-config"
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
