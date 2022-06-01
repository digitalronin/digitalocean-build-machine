terraform {
  required_version = ">= 1.2, < 1.3"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.18"
    }
  }
}

variable "do_token" {}

variable "private_key_file" {
  default = "~/.ssh/digitalocean_buildvm"
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "buildvm" {
  name       = "Build VM"
  public_key = file("${var.private_key_file}.pub")
}

resource "digitalocean_droplet" "buildvm" {
  image      = "ubuntu-20-04-x64"
  name       = "buildvm"
  region     = "sgp1"
  # size     = "s-1vcpu-1gb" # minimum - $5/month
  # size     = "s-2vcpu-2gb" # $15/month
  size       = "s-4vcpu-8gb" # $40/month, $0.06/hour
  monitoring = true
  ssh_keys   = [digitalocean_ssh_key.buildvm.fingerprint]
  tags       = []
}

output "droplet_ip" {
  value = digitalocean_droplet.buildvm.ipv4_address
}

resource "local_file" "ip-address" {
  content  = digitalocean_droplet.buildvm.ipv4_address
  filename = "${path.module}/.ip"
}

resource "local_file" "ansible-script" {
  content  = templatefile("${path.module}/ansible.sh.tpl", { ip = digitalocean_droplet.buildvm.ipv4_address, private_key_file = var.private_key_file })
  filename = "${path.module}/ansible.sh"
}

