terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
  required_version = ">= 0.13"
}

variable "hcloud_token" {
  type        = string
  sensitive   = true
}

variable "ssh_key_name" {
  type        = string
}