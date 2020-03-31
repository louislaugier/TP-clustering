data_dir = "/opt/consul"

bind_addr   = "172.20.1.10"
client_addr = "172.20.1.10"

ui     = true
server = false

retry_join = ["172.20.0.10"]

acl {
  enabled                  = false
  default_policy           = "allow"
  enable_token_persistence = true
}

connect {
  enabled = true
}
