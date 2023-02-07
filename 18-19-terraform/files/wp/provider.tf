terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.17.0"
    }
  }
  backend "kubernetes" {
    secret_suffix = "state"
    config_path   = "~/.kube/config"
    namespace     = "kube-system"
  }
}

provider "kubernetes" {
  host = "https://192.168.49.2:8443"

  client_certificate     = file("/home/vagrant/.minikube/profiles/minikube/client.crt")
  client_key             = file("/home/vagrant/.minikube/profiles/minikube/client.key")
  cluster_ca_certificate = file("/home/vagrant/.minikube/ca.crt")
}