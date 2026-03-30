include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//metallb"
}

inputs = {
  name          = "metallb"
  namespace     = "metallb-system"
  chart_version = "0.15.3"
  ip_range      = "192.168.254.201-192.168.254.210"
  speaker_tolerations = [
    {
      key      = "workload"
      operator = "Equal"
      value    = "ephemeral"
      effect   = "NoSchedule"
    }
  ]
}
