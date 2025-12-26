resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
  depends_on = [
    ansible_playbook.playbook_configure,
  ]
}


resource "kubernetes_namespace" "tailscale" {
  metadata {
    name = "tailscale"
  }
  depends_on = [
    ansible_playbook.playbook_configure,
  ]
}


resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
  depends_on = [
    ansible_playbook.playbook_configure,
  ]
}


resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  version    = "9.1.9"
}

resource "helm_release" "tailscale_operator" {
  name       = "tailscale-operator"
  repository = "https://pkgs.tailscale.com/helmcharts"
  chart      = "tailscale-operator"
  namespace  = kubernetes_namespace.tailscale.metadata[0].name
  version    = "1.92.3"
  set = [
    {
      name  = "oauth.clientId"
      value = var.tailscale_oauth_client_id
      type  = "string"
    },
    {
      name  = "oauth.clientSecret"
      value = var.tailscale_oauth_client_secret
      type  = "string"
    }
  ]
}

resource "helm_release" "kube_prometheus_stack" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
}

