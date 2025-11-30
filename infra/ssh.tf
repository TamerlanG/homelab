resource "hcloud_ssh_key" "personal" {
  name       = "personal-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
