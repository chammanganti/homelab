include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//loki"
}

inputs = {
  name          = "loki"
  namespace     = "monitoring"
  chart_version = "6.55.0"
}
