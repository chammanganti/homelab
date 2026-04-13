include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules//cloudflared"
}

inputs = {
  name          = "cloudflared"
  namespace     = "cloudflared"
  chart_version = "0.3.2"
  tunnel_name   = "homelab"
}
