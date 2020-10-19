# vault-bootstrap

# The Vault provider.
provider "vault" {}

# auth - check auth.tf

# Enable the KV2 secrets engine on secret/git for gv.
resource "vault_mount" "kv2_git" {
  path        = "secret/git"
  type        = "kv-v2"
  description = "KV storage for gv."
}

# pki - check pki.tf

# consul - check consul.tf

# nomad - check nomad.tf

# policies - check policies.tf

# tokens - check tokens.tf
