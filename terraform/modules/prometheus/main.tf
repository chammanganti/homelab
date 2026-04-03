resource "helm_release" "prometheus" {
  name             = var.name
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      rpi_ip = var.rpi_ip
    })
  ]
}
