variable "kubernetes_config_path" {
  type    = string
  default = "~/.kube/config"
}

variable "kubernetes_config_context" {
  type    = string
  default = "kind-remix"
}

variable "vault_address" {
  type    = string
  default = "http://vault.apps-127-0-0-1.nip.io"
}