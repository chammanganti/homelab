include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../modules//prometheus"
}

inputs = {
  name          = "prometheus"
  namespace     = "monitoring"
  chart_version = "28.15.0"
  rpi_ip        = "192.168.254.101"
}
