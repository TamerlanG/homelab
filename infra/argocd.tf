resource "kubernetes_manifest" "argocd_project_homelab" {
  manifest = yamldecode(
    file("${path.module}/../k8s/argocd/projects/homelab-project.yaml")
  )

  depends_on = [
    helm_release.argocd,
  ]
}

resource "kubernetes_manifest" "argocd_applicationset_homelab_apps" {
  manifest = yamldecode(
    replace(
      file("${path.module}/../k8s/argocd/root/homelab-applicationset.yaml"),
      "auto-detect-from-env-var",
      var.argocd_repo_url,
    )
  )

  depends_on = [
    helm_release.argocd,
    kubernetes_manifest.argocd_project_homelab,
  ]
}
