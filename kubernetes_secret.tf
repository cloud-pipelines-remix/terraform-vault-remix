resource "kubernetes_secret" "concourse_web" {
  metadata {
    name      = "concourse-web"
    namespace = "concourse"
  }

  data = {
    github-client-id        = var.concourse_github_client_id,
    github-client-secret    = var.concourse_github_client_secret
    host-key                = tls_private_key.concourse_host_key.private_key_pem
    local-users             = "test:test"
    session-signing-key     = tls_private_key.concourse_session_signing_key.private_key_pem
    vault-client-auth-param = format("role_id:%s,secret_id:%s", vault_approle_auth_backend_role.concourse.role_id, vault_approle_auth_backend_role_secret_id.concourse.secret_id)
    worker-key-pub          = tls_private_key.concourse_worker_key.public_key_openssh
  }

  type = "Opaque"
}

resource "kubernetes_secret" "concourse_worker" {
  metadata {
    name      = "concourse-worker"
    namespace = "concourse"
  }

  data = {
    host-key-pub   = tls_private_key.concourse_host_key.public_key_openssh
    worker-key     = tls_private_key.concourse_worker_key.private_key_pem
    worker-key-pub = tls_private_key.concourse_worker_key.public_key_openssh
  }

  type = "Opaque"
}