include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//monitoring-exporters"
}

inputs = {
  namespace                  = "monitoring"
  node_exporter_version      = "4.52.2"
  kube_state_metrics_version = "7.2.2"
  promtail_version           = "6.17.1"
  loki_url                   = "http://192.168.254.166:3100"
}
