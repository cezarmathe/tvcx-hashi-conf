# vault-bootstrap - tokens

### Tokens for fabio ###

resource "vault_token" "fabio_tvcxpi" {
  policies = ["pki_tvcx_issue"]

  renewable = true
  ttl       = "24h"

  renew_min_lease = 43200
  renew_increment = 86400
}

resource "vault_token" "fabio_tvcxvps" {
  policies = ["pki_tvcx_issue"]

  renewable = true
  ttl       = "24h"

  renew_min_lease = 43200
  renew_increment = 86400
}

resource "vault_token" "fabio_tvcxserver" {
  policies = ["pki_tvcx_issue"]

  renewable = true
  ttl       = "24h"

  renew_min_lease = 43200
  renew_increment = 86400
}

### Tokens for nomad ###

resource "vault_token" "nomad_tvcxpi" {
  depends_on = [vault_policy.nomad_server]

  policies = ["nomad_server"]

  ttl       = "72h"
  no_parent = true

  renew_min_lease = 43200
  renew_increment = 86400
}

resource "vault_token" "nomad_tvcxvps" {
  depends_on = [vault_policy.nomad_server]

  policies = ["nomad_server"]

  ttl       = "72h"
  no_parent = true

  renew_min_lease = 43200
  renew_increment = 86400
}

resource "vault_token" "nomad_tvcxserver" {
  depends_on = [vault_policy.nomad_server]

  policies = ["nomad_server"]

  ttl       = "72h"
  no_parent = true

  renew_min_lease = 43200
  renew_increment = 86400
}
