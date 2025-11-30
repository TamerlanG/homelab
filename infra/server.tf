resource "hcloud_server" "homelab" {
  name        = "homelab-server"
  server_type = "cax11"
  image       = "ubuntu-22.04"
  location    = "hel1"
  ssh_keys    = [hcloud_ssh_key.personal.id]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
