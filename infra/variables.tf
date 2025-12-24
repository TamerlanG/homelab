variable "hcloud_token" {
  sensitive = true
}

variable "tailscale_oauth_client_id" {
  sensitive = true
}

variable "tailscale_oauth_client_secret" {
  sensitive = true
}

variable "argocd_repo_url" {
  description = "Git repo URL for Argo CD applications (SSH or HTTPS)"
  type        = string
}
