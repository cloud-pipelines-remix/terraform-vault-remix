resource "vault_kv_secret_v2" "concourse_github_auth" {
  mount = vault_mount.concourse.path
  name  = "github-auth"

  data_json = jsonencode(
    {
      github_client_id     = var.concourse_github_client_id,
      github_client_secret = var.concourse_github_client_secret
    }
  )
}