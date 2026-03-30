resource "helm_release" "traefik" {
  name             = var.name
  repository       = "https://traefik.github.io/charts"
  chart            = "traefik"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      tls_secret_name = var.tls_secret_name
      tolerations     = var.tolerations
    })
  ]
}
