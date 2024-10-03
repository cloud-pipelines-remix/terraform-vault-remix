resource "vault_mount" "concourse" {
  path = "concourse"
  type = "generic"
}