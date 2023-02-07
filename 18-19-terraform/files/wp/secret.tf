resource "kubernetes_secret_v1" "mysql-secret" {
  metadata {
    name      = "mysql-secret"
    namespace = kubernetes_namespace_v1.wp-ns.metadata.0.name
  }

  data = {
    MYSQL_DATABASE             = var.mysql_wp_db_name
    MYSQL_USER                 = "${var.mysql_wp_db_user}"
    MYSQL_PASSWORD             = var.mysql_wp_db_pawword
    MYSQL_RANDOM_ROOT_PASSWORD = var.mysql_wp_db_root_password
  }

  type = "Opaque"
}