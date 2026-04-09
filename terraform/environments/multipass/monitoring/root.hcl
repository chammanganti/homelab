locals {
  k3s_config     = "${get_env("HOME")}/.kube/homelab-monitoring"
  relative_path  = path_relative_to_include()
  workspace_name = replace(local.relative_path, "/", "-")
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  cloud {
    organization = "chammanganti-homelab-monitoring"
    workspaces {
      name = "kind-${local.workspace_name}"
    }
  }
}
EOF
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
  }
}

provider "helm" {
  kubernetes = {
    config_path = "${local.k3s_config}"
  }
}
  EOF
}
