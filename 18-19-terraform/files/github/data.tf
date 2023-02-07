data "terraform_remote_state" "wp" {
  backend = "kubernetes" 
  config = {
    secret_suffix = "state"
    config_path   = "~/.kube/config"
    namespace     = "kube-system"
  }
}

output "full_details" {
  value = data.terraform_remote_state.wp.outputs
}

output "wp_container" {
  value = data.terraform_remote_state.wp.outputs.conainer_name_wp
}