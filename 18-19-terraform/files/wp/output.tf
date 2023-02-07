# output "wp_cluster_ip" {
#   value = module.wp-srv.spec[0].cluster_ip
# }

# output "mysql_cluster_ip" {
#   value = module.mysql-srv.spec.0.cluster_ip
# }

output "conainer_name_wp" {
  # sensitive = true
  value     = kubernetes_deployment_v1.wp-dep.spec[0].template[0].spec.0.container[0].name
}

output "conainer_name_mysql" {
  # sensitive = true
  value     = kubernetes_deployment_v1.mysql-dep.spec[0].template[0].spec.0.container[0].name
}
