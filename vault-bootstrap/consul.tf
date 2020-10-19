# vault-bootstrap - consul

# Enable the Consul secrets engine.
resource "vault_consul_secret_backend" "consul" {
  path        = "consul"
  description = "Consul secrets engine."

  address = "127.0.0.1:8500"
  scheme  = "https"
  token   = var.consul_token

  default_lease_ttl_seconds = 14400 # Four hours
  max_lease_ttl_seconds     = 86400 # One day
}

### Configure the Consul secrets engine ###

resource "vault_generic_endpoint" "consul_role_agent_control" {
  depends_on           = [vault_consul_secret_backend.consul]
  path                 = "consul/roles/agent_control"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": "operator_agent_control"
}
EOT
}
