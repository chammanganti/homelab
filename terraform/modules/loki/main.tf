resource "helm_release" "loki" {
  name             = var.name
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "loki"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  values = [file("${path.module}/values.yaml")]
}
