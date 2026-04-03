include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../modules//grafana"
}

inputs = {
  name           = "grafana"
  namespace      = "monitoring"
  chart_version  = "10.5.15"
  prometheus_url = "http://prometheus-server.monitoring.svc.cluster.local"
  loki_url       = "http://loki.monitoring.svc.cluster.local:3100"
}
