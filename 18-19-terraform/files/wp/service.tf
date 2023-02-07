module "mysql-srv" {
  source          = "../modules/service"
  srv_name        = "mysql-service"
  srv_labels      = local.labels
  srv_ns          = kubernetes_namespace_v1.wp-ns.metadata.0.name
  srv_port        = var.mysql_port
  srv_target_port = var.mysql_port
  srv_selector = {
    app = var.app_name
  }
}

module "wp-srv" {
  source         = "git::https://github.com/Fenikks/terffarom-demo.git//service2"
  srv_name        = "wordpress"
  srv_labels      = local.labels
  srv_ns          = kubernetes_namespace_v1.wp-ns.metadata.0.name
  srv_port        = var.wp_srv_port
  srv_target_port = var.wp_port
  srv_selector = {
    app = var.app_name
  }
}
