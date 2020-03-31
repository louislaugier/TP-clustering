api_addr     = "http://172.20.1.10:8200"
cluster_addr = "https://172.20.1.10:8201"

vault {
  address = "http://172.20.0.10:8200"
}

listener "tcp" {
  address     = "172.20.1.10:8100"
  tls_disable = true
}
