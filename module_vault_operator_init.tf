module "vault_operator_init" {
  depends_on   = [helm_release.vault]
  source       = "Invicton-Labs/shell-resource/external"
  command_unix = "kubectl exec -it vault-0 -n vault -- /bin/sh -c 'vault operator init -key-shares=1 -key-threshold=1 -format=yaml > /tmp/init.yaml && vault operator unseal $(cat /tmp/init.yaml | grep - | cut -c3-100 | head -1) &>/dev/null && cat /tmp/init.yaml | grep root_token | cut -c13-100'"
  working_dir  = path.root
}

output "vault_client_token" {
  value     = module.vault_operator_init.stdout
  sensitive = true
}