include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//traefik"
}

inputs = {
  name          = "traefik"
  namespace     = "traefik"
  chart_version = "v39.0.5"
  tolerations = [
    {
      key      = "workload"
      operator = "Equal"
      value    = "ephemeral"
      effect   = "NoSchedule"
    }
  ]
}
