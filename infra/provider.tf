terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.57.0"
    }
    ansible = {
      version = "~> 1.3.0"
      source  = "ansible/ansible"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.1.1"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "kubernetes" {
  config_path    = "config/kubeconfig"
  config_context = "homelab"
}

provider "helm" {
  kubernetes = {
    config_path = "config/kubeconfig"
  }
}
