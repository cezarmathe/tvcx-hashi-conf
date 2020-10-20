# vault-tokens

# The Vault provider.
provider "vault" {}

### Tokens for fabio ###

resource "vault_token" "fabio_tvcxpi" {
  policies = ["pki_tvcx_issue"]

  renewable = true
  ttl       = "24h"
  no_parent = true

  renew_min_lease = 43200
  renew_increment = 86400
}

resource "vault_token" "fabio_tvcxvps" {
  policies = ["pki_tvcx_issue"]

  renewable = true
  ttl       = "24h"
  no_parent = true

  renew_min_lease = 43200
  renew_increment = 86400
}

resource "vault_token" "fabio_tvcxserver" {
  policies = ["pki_tvcx_issue"]

  renewable = true
  ttl       = "24h"
  no_parent = true

  renew_min_lease = 43200
  renew_increment = 86400
}

### Tokens for nomad ###

resource "vault_token" "nomad_tvcxpi" {
  policies = ["nomad_server"]

  ttl       = "72h"
  no_parent = true

  renewable = true
  renew_min_lease = 43200
  renew_increment = 86400
}

resource "vault_token" "nomad_tvcxvps" {
  policies = ["nomad_server"]

  renewable = true
  ttl       = "72h"
  no_parent = true

  renew_min_lease = 43200
  renew_increment = 86400
}

resource "vault_token" "nomad_tvcxserver" {
  policies = ["nomad_server"]

  renewable = true
  ttl       = "72h"
  no_parent = true

  renew_min_lease = 43200
  renew_increment = 86400
}
