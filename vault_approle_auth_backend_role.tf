resource "vault_approle_auth_backend_role" "concourse" {
  backend        = vault_auth_backend.approle.path
  role_name      = "concourse"
  token_policies = ["concourse"]
  token_period   = "86400"
}