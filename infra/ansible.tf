resource "ansible_host" "homelab" {
  name = var.homelab_ip
  variables = {
    ansible_user                 = "root"
    ansible_ssh_private_key_file = "~/.ssh/id_rsa"
  }
}

resource "ansible_playbook" "playbook" {
  playbook = "playbook.yaml"
  name     = ansible_host.homelab.name
}
