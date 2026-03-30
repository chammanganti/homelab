variable "name" {
  description = "Traefik name"
  type        = string
  default     = "traefik"
}

variable "namespace" {
  description = "Namespace to install traefik"
  type        = string
  default     = "traefik"
}

variable "chart_version" {
  description = "Traefik helm chart version"
  type        = string
  default     = "v39.0.5"
}

variable "tls_secret_name" {
  type    = string
  default = "wildcard-chammanganti-dev-tls"
}

variable "tolerations" {
  type = list(object({
    key      = string
    operator = string
    value    = string
    effect   = string
  }))
  default = []
}
