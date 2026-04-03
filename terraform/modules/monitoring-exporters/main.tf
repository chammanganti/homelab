resource "helm_release" "node_exporter" {
  name             = "node-exporter"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus-node-exporter"
  namespace        = var.namespace
  create_namespace = true
  version          = var.node_exporter_version

  wait    = true
  timeout = 120
}

resource "helm_release" "kube_state_metrics" {
  name             = "kube-state-metrics"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-state-metrics"
  namespace        = var.namespace
  create_namespace = true
  version          = var.kube_state_metrics_version

  wait    = true
  timeout = 120

  set = [
    {
      name  = "hostNetwork"
      value = "true"
    }
  ]
}

resource "helm_release" "promtail" {
  name             = "promtail"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "promtail"
  namespace        = var.namespace
  create_namespace = true
  version          = var.promtail_version

  wait    = true
  timeout = 120

  values = [templatefile("${path.module}/promtail-values.yaml.tpl", {
    loki_url = var.loki_url
  })]
}
