data_dir  = "/opt/consul"

bind_addr   = "172.20.0.10"
client_addr = "172.20.0.10"

ui        = true
server    = true
bootstrap = true

acl {
  enabled                  = false
  default_policy           = "allow"
  enable_token_persistence = true
}

connect {
  enabled = true
}
