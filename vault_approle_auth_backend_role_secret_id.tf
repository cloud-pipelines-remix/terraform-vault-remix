resource "vault_approle_auth_backend_role_secret_id" "concourse" {
  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.concourse.role_name
}