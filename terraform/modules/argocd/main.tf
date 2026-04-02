resource "helm_release" "argocd" {
  name             = var.name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  set = [
    {
      name  = "global.domain"
      value = var.domain
    },
    {
      name  = "notifications.enabled"
      value = false
    },
    {
      name  = "dex.enabled"
      value = false
    }
  ]
}
