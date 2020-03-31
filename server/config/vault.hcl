ui = true

storage "consul" {
  address          = "172.20.1.10:8500"
  path             = "vault/"
  consistency_mode = "strong"
}

listener "tcp" {
  address         = "172.20.0.10:8200"
  cluster_address = "172.20.0.10:8201"
  tls_disable     = true
}
