# Policy for creating Consul agent tokens.

node "{{ policies_template.node_name }}" {
    policy = "write"
}
