# consul-bootstrap variables

variable "consul_address" {
  type = string
  description = "The address of the Consul agent."
}

variable "consul_token" {
  type = string
  description = "The Consul token required by the Consul provider."
}

variable "consul_ui_addr" {
  type = string
  description = "The address for the Consul UI that should be picked up by fabio."
  default = "https://127.0.0.1:8500"
}
