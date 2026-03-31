include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//argocd"
}

inputs = {
  name          = "argocd"
  namespace     = "argocd"
  chart_version = "9.4.17"
}
