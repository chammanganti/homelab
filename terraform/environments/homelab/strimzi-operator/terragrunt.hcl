include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//strimzi-operator"
}

inputs = {
  name          = "strimzi-operator"
  namespace     = "kafka"
  chart_version = "0.51.0"
}
