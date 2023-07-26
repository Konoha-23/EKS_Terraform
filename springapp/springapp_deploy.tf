resource "kubernetes_deployment_v1" "springapp-deploy" {
  metadata {
    name = "springapp"
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
        app = "springapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "springapp"
        }
      }

      spec {
        volume {
          name = "mongo-configmap"
          config_map {
            name = "mongo-config"
          }
        }
        container {
          image = " princebabs/springapp:latest"
          name  = "springapp-pod"

          port {
            container_port = 8080
          }

          volume_mount {
            mount_path = "/config"
            name = "mongo-configmap"
          }

          env {
            name = "MONGO_DB_USERNAME"
            value_from {
                config_map_key_ref {
                    key = "mongo-root-user"
                    name = "mongo-config"
                }
            }
          }

           env {
            name = "MONGO_DB_PASSWORD"
            value_from {
                secret_key_ref {
                    key = "mongodb-root-password"
                    name = "mongo-secret"
                }
            }
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
