provider "nomad" {
    address = "http://172.20.0.10:4646"
    region = "global"
}

resource "nomad_job" "redis-cache" {
    jobspec = file("${path.module}/redis-cache.nomad")
}

resource "nomad_job" "postgres" {
    jobspec = file("${path.module}/postgres.nomad")
}
