resource "helm_release" "grafana" {
  name             = var.name
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      prometheus_url = var.prometheus_url
      loki_url       = var.loki_url
    })
  ]
}
