terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.17.0"
    }
  }
  backend "kubernetes" {
    secret_suffix = "github-state"
    config_path   = "~/.kube/config"
    namespace     = "kube-system"
  }
}

provider "github" {
  token = var.tf_token
}