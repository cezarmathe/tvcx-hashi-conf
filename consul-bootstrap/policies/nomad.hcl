# Policy for creating tokens for Nomad.

agent_prefix "" {
  policy = "read"
}

key_prefix "" {
  policy = "read"
}

node_prefix "" {
  policy = "read"
}

service_prefix "" {
  policy = "write"
}
