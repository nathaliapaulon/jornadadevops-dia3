terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = "dop_v1_f9e3e43a8b93633b870c3ec49b4266d3cb97eaafc9244f31716e08458900e7bf"
}

resource "digitalocean_droplet" "jenkins" {
  image  = "ubuntu-22-04-x64"
  name   = "jenkins-vm"
  region = "nyc1"
  size   = "s-2vcpu-2gb"
}
