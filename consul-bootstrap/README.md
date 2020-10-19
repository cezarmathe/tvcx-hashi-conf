# tf-consul-bootstrap

This module configures Consul agents for production use after their ACL system has just been bootstrapped.

## Policies

- **dns** - access the DNS interface
- **fabio** - give Fabio access to Consul service catalog and the ability to register itself
- **nomad** - give Nomad access to Consul
- **vault** - give Vault access to the Consul KV for storage backend purposes

## Roles

- **operator** - operator role

## Tokens

- **anonymous** - make the anon token be able to make DNS queries
- **agent-\*** - agent tokens
- **fabio-\*** - tokens for fabio
- **nomad-\*** - tokens for nomad
- **vault-\*** - tokens for vault
- **secrets_engine** - token for the vault secrets engine for consul

## KV

- **fabio/config** - manual route to the consul ui
