locals {
  k3s_config     = "${get_env("HOME")}/.kube/kind/monitoring"
  relative_path  = path_relative_to_include()
  workspace_name = replace(local.relative_path, "/", "-")
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  cloud {
    organization = "chammanganti-kind-monitoring"
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
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.1.6"
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
