resource "helm_release" "cloudflared" {
  name             = var.name
  repository       = "https://cloudflare.github.io/helm-charts"
  chart            = "cloudflare-tunnel"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  values = [
    yamlencode({
      cloudflare = {
        account    = var.account
        tunnelName = var.tunnel_name
        tunnelId   = var.tunnel_id
        secret     = var.secret
      }
    })
  ]
}
