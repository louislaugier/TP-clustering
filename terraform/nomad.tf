provider "nomad" {
    address = "http://172.20.0.10:4646"
    region = "global"
}

resource "nomad_job" "redis" {
    jobspec = file("${path.module}/example.nomad")
}

resource "nomad_job" "postgres" {
    jobspec = file("${path.module}/example2.nomad")
}