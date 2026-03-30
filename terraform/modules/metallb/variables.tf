variable "name" {
  description = "MetalLB name"
  type        = string
  default     = "metallb"
}

variable "namespace" {
  description = "Namespace to install MetalLB"
  type        = string
  default     = "metallb-system"
}

variable "chart_version" {
  description = "MetalLB helm chart version"
  type        = string
  default     = "0.15.3"
}

variable "ip_range" {
  description = "MetalLB ip range"
  type        = string
  default     = "192.168.254.201-192.168.254.210"
}

variable "speaker_tolerations" {
  description = "MetalLB speaker pods tolerations"
  type = list(object({
    key      = string
    operator = string
    value    = string
    effect   = string
  }))
  default = []
}
