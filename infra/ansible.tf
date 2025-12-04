resource "ansible_host" "homelab" {
  name = hcloud_server.homelab.ipv4_address
  groups = [
    ansible_group.homelab_group.name,
  ]
  variables = {
    ansible_user                 = "root"
    ansible_ssh_private_key_file = "~/.ssh/id_rsa"
  }
}

resource "ansible_group" "homelab_group" {
  name = "homelab_group"
}

resource "ansible_playbook" "playbook" {
  playbook = "playbook.yaml"
  name     = ansible_host.homelab.name
}
