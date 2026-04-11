resource "helm_release" "kube_prometheus_stack" {
  name             = var.name
  repository       = "oci://ghcr.io/prometheus-community/charts"
  chart            = "kube-prometheus-stack"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  values = [templatefile("${path.module}/values.yaml.tpl", {
    grafana_existing_secret = var.grafana_existing_secret
  })]
}
