terraform {
  required_version = ">= 0.14.5, < 0.15"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.4"
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
  size       = "s-1vcpu-1gb"
  monitoring = true
  ssh_keys   = [digitalocean_ssh_key.buildvm.fingerprint]
  # user_data  = file("setup_vm.sh")
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

