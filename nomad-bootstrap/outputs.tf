# nomad-bootstrap - outputs

output "secrets_engine" {
  value = nomad_acl_token.secrets_engine
}
