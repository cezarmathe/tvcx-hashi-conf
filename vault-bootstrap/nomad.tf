# vault-bootstrap - nomad

# Enable the Nomad secrets engine.
resource "vault_mount" "nomad" {
  path        = "nomad"
  type        = "nomad"
  description = "Nomad secrets engine."

  default_lease_ttl_seconds = 14400 # Four hours
  max_lease_ttl_seconds     = 86400 # One day

  options = {
    address = "https://10.125.66.0:4646" # this probably won't work
    token   = var.nomad_token
  }
}

### Configure the Nomad secrets engine ###

resource "vault_generic_endpoint" "nomad_role_dev" {
  depends_on           = [vault_mount.nomad]
  path                 = "nomad/role/dev"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": "dev"
}
EOT
}

resource "vault_generic_endpoint" "nomad_role_op" {
  depends_on           = [vault_mount.nomad]
  path                 = "nomad/role/op"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": "op"
}
EOT
}

### Configure Nomad-Vault integration

resource "vault_generic_endpoint" "nomad_role" {
  depends_on           = [vault_policy.nomad_server]
  path                 = "auth/token/roles/nomad-role"
  ignore_absent_fields = true

  disable_read = true

  data_json = file("${path.module}/roles/nomad.json")
}
