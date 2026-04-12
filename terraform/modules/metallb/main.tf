resource "kubectl_manifest" "metallb_namespace" {
  yaml_body = <<YAML
    apiVersion: v1
    kind: Namespace
    metadata:
      name: ${var.namespace}
      labels:
        pod-security.kubernetes.io/enforce: privileged
        pod-security.kubernetes.io/audit: privileged
        pod-security.kubernetes.io/warn: privileged
  YAML
}

resource "helm_release" "metallb" {
  name             = var.name
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  values = [
    yamlencode({
      speaker = {
        tolerations = var.speaker_tolerations
      }
    })
  ]

  depends_on = [kubectl_manifest.metallb_namespace]
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
