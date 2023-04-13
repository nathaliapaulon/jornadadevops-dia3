terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
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
  #   ssh_keys = [data.digitalocean_ssh_key.nath.id]
}

#data "digitalocean_ssh_key" "nath" {
#  name = "nath"
#}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name   = "k8s"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.24.4-do.0"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-2gb"
    node_count = 1
  }
}