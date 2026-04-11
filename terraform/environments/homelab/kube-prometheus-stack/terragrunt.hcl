include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//kube-prometheus-stack"
}

inputs = {
  name                    = "kube-prometheus-stack"
  namespace               = "monitoring"
  chart_version           = "83.3.0"
  grafana_existing_secret = "grafana-admin-credentials"
}
