include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//metallb"
}

inputs = {
  ip_range = "192.168.254.201-192.168.254.210"
}
