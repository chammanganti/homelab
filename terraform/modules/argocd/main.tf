resource "helm_release" "argocd" {
  name             = var.name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      domain          = var.domain
      tls_secret_name = var.tls_secret_name
    })
  ]
}
