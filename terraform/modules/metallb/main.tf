locals {
  namespace = "metallb-system"
}

resource "helm_release" "metallb" {
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  namespace        = local.namespace
  create_namespace = true
  version          = "0.15.3"

  wait    = true
  timeout = 30
}

resource "kubenetes_manifest" "metallb_ip_pool" {
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "IPAddressPool"
    metadata = {
      name      = "homelab-pool"
      namespace = "${local.namespace}"
    }
    spec = {
      addresses = [var.ip_range]
    }
  }

  depends_on = [helm_release.metallb]
}

resource "kubernetes_manifest" "metallb_l2_advertisement" {
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "L2Advertisement"
    metadata = {
      name      = "homelab-l2"
      namespace = "${local.namespace}"
    }
    spec = {
      ipAddressPool = ["homelab-pool"]
    }
  }

  depends_on = [helm_release.metallb]
}
