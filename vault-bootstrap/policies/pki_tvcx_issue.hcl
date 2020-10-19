# Policy for issuing certificates for tvcx pki.

path "cubbyhole/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "pki_tvcx/issue/${role}" {
    capabilities = ["create", "read", "update"]
}
