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

resource "kubectl_manifest" "metallb_ip_pool" {
  yaml_body = <<YAML
    apiVersion: metallb.io/v1beta1
    kind: IPAddressPool
    metadata:
      name: homelab-pool
      namespace: ${var.namespace}
    spec:
      addresses:
        - ${var.ip_range}
  YAML

  depends_on = [helm_release.metallb]
}

resource "kubectl_manifest" "metallb_l2_advertisement" {
  yaml_body = <<YAML
    apiVersion: metallb.io/v1beta1
    kind: L2Advertisement
    metadata:
      name: homelab-l2
      namespace: ${var.namespace}
    spec:
      ipAddressPools:
        - homelab-pool
  YAML

  depends_on = [helm_release.metallb]
}
