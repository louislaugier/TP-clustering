job "postgres" {
  datacenters = ["dc1"]
  type = "service"
  update {
    max_parallel = 1
    min_healthy_time = "10s"
    healthy_deadline = "3m"
    progress_deadline = "10m"
    auto_revert = false
    canary = 0
  }
  migrate {
    max_parallel = 1
    health_check = "checks"
    min_healthy_time = "10s"
    healthy_deadline = "5m"
  }
  group "db" {
    count = 1
    restart {
      attempts = 2
      interval = "30m"
      delay = "15s"
      mode = "fail"
    }
    ephemeral_disk {
      size = 300
    }
    task "postgres" {
      driver = "docker"
      config {
        image = "postgres:12"

        port_map {
          db = 5432
        }
      }

      env {
        "POSTGRES_USER" = "louis"
        "POSTGRES_PASSWORD" = "vault"
      }
      resources {
        cpu    = 500
        memory = 256
        network {
          mbits = 10
          port  "db"  {}
        }
      }
      service {
        name = "postgres"
        tags = ["global", "db"]
        port = "db"

        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
