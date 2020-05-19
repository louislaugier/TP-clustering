provider "nomad" {
    address = "http://172.20.0.10:4646"
    region = "global"
}

resource "nomad_job" "mysql" {
    jobspec = file("${path.module}/mysql.nomad")
}
