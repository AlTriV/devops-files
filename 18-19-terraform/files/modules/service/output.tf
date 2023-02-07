output "cluster_ip" {
  value = kubernetes_service.this[0].spec[0].cluster_ip
}
