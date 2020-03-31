data_dir = "/opt/nomad"

bind_addr = "172.20.1.10"

server {
  enabled = false
}

client {
  enabled = true

  network_interface = "eth1"

  server_join {
    retry_join = [
      "172.20.0.10"
    ]
  }
}

telemetry {
  publish_allocation_metrics = true
  publish_node_metrics       = true
  prometheus_metrics         = true
}

ports {
  http = 4646
  rpc  = 4647
  serf = 4648
}

consul {
  address             = "172.20.1.10:8500"
  server_service_name = "nomad-server"
  client_service_name = "nomad-client"
  auto_advertise      = true
  server_auto_join    = true
  client_auto_join    = true
}

acl {
  enabled = false
}

// vault {
//   enabled               = true
//   address               = "http://172.20.1.10:8200"
//   allow_unauthenticated = false
// }
