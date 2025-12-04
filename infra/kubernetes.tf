resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
  depends_on = [
    ansible_playbook.playbook_configure,
  ]
}
