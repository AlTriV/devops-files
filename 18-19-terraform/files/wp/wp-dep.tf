resource "kubernetes_deployment_v1" "wp-dep" {
  metadata {
    name      = "wordpress"
    labels    = local.labels
    namespace = kubernetes_namespace_v1.wp-ns.metadata.0.name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "wordpress"
      }
    }

    template {
      metadata {
        labels = {
          app = "wordpress"
        }
      }

      spec {
        container {
          image = "wordpress"
          name  = "wordpress"
          port {
            container_port = var.wp_port
          }
          env {
            name = "WORDPRESS_DB_USER"
            value_from {
              secret_key_ref {
                name = "mysql-secret"
                key  = "MYSQL_USER"
              }
            }
          }

          env {
            name = "WORDPRESS_DB_USER"
            value_from {
              secret_key_ref {
                name = "mysql-secret"
                key  = "MYSQL_USER"
              }
            }
          }

          env {
            name = "WORDPRESS_DB_PASSWORD"
            value_from {
              secret_key_ref {
                name = "mysql-secret"
                key  = "MYSQL_PASSWORD"
              }
            }
          }

          env {
            name = "WORDPRESS_DB_NAME"
            value_from {
              secret_key_ref {
                name = "mysql-secret"
                key  = "MYSQL_DATABASE"
              }
            }
          }

          env {
            name  = "WORDPRESS_DB_HOST"
            value = "mysql"
          }

          volume_mount {
            mount_path = "/var/www/html"
            name       = "wordpress-data"
          }
        }

        volume {
          name = "wordpress-data"
          persistent_volume_claim {
            claim_name = "wp-pvc"
          }
        }
      }
    }
  }
}