include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//sealed-secrets"
}

inputs = {
  name          = "sealed-secrets"
  namespace     = "sealed-secrets"
  chart_version = "2.18.4"
}
