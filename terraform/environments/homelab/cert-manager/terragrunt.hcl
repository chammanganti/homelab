include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//cert-manager"
}

inputs = {
  name          = "cert-manager"
  namespace     = "cert-manager"
  chart_version = "v1.20.0"
  email         = "chammanganti@gmail.com"
}
