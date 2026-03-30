locals {
  k3s_config = "${get_env("HOME")}/.kube/homelab"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "3.1.1"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.1.6"
    }
  }

  cloud {
    organization = "chammanganti-homelab"
    workspaces {
      name = "homelab"
    }
  }
}

provider "helm" {
  kubernetes = {
    config_path = "${local.k3s_config}"
  }
}

provider "kubectl" {
  config_path = "${local.k3s_config}"
}
  EOF
}
