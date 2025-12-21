variable "hcloud_token" {
  sensitive = true
}

variable "argocd_repo_url" {
  description = "Git repo URL for Argo CD applications (SSH or HTTPS)"
  type        = string
}
