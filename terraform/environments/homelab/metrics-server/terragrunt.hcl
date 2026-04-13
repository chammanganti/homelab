include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//metrics-server"
}

inputs = {
  name          = "metrics-server"
  namespace     = "kube-system"
  chart_version = "3.13.0"
}
