terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    vault = {
      source = "hashicorp/vault"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kubernetes_config_path
  }
}

provider "kubernetes" {
  config_context = var.kubernetes_config_context
  config_path    = var.kubernetes_config_path
}

provider "vault" {
  address          = var.vault_address
  token            = module.vault_operator_init.stdout
  skip_child_token = true
}