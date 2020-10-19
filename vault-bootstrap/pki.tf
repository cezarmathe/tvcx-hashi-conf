# vault-bootstrap - pki

# Enable the PKI secrets engine for TVCX.
resource "vault_mount" "pki" {
  path        = "pki_tvcx"
  type        = "pki"
  description = "PKI secrets backend for TVCX."

  default_lease_ttl_seconds = 604800   # One week
  max_lease_ttl_seconds     = 2419200  # Four weeks
}

### Configure the PKI secrets engine ###

resource "vault_pki_secret_backend_config_ca" "intermediate" {
  depends_on = [vault_mount.pki]

  backend    = vault_mount.pki.path
  pem_bundle = file("${path.module}/bundle.pem")
}

resource "vault_pki_secret_backend_config_urls" "config_urls" {
  backend = vault_mount.pki.path
  issuing_certificates = ["http://127.0.0.1:8200/v1/${vault_mount.pki.path}/ca"]
  crl_distribution_points = ["http://127.0.0.1:8200/v1/${vault_mount.pki.path}/crl"]
}

resource "vault_pki_secret_backend_role" "role_cons_dot_ul" {
  backend = vault_mount.pki.path

  name               = "cons_dot_ul"
  allowed_domains    = ["cons.ul"]
  allow_bare_domains = false
  allow_subdomains   = true
}
