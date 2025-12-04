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

resource "ansible_playbook" "playbook_install_k3s" {
  playbook   = "ansible/playbook-install-k3s.yaml"
  name       = ansible_host.homelab.name
  replayable = false
}

resource "ansible_playbook" "playbook_configure" {
  playbook = "ansible/playbook-configure.yaml"
  name     = ansible_host.homelab.name
  depends_on = [
    ansible_playbook.playbook_install_k3s,
  ]
}

