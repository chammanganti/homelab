resource "helm_release" "cert_manager" {
  name             = var.name
  repository       = "oci://quay.io/jetstack/charts"
  chart            = "cert-manager"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  wait    = true
  timeout = 300

  set = [
    {
      name  = "crds.enabled"
      value = "true"
    }
  ]
}

resource "kubectl_manifest" "cluster_issuer" {
  yaml_body = <<YAML
    apiVersion: cert-manager.io/v1
    kind: ClusterIssuer
    metadata:
      name: letsencrypt-prod
    spec:
      acme:
        email: ${var.email}
        server: https://acme-v02.api.letsencrypt.org/directory
        privateKeySecretRef:
          name: letsencrypt-prod-account-key
        solvers:
          - dns01:
              cloudflare:
                apiTokenSecretRef:
                  name: cloudflare-api-token
                  key: api-token
  YAML

  depends_on = [helm_release.cert_manager]
}
