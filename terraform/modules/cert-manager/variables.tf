variable "name" {
  description = "Cert-manager name"
  type        = string
  default     = "cert-manager"
}

variable "namespace" {
  description = "Namespace to install cert-manager"
  type        = string
  default     = "cert-manager"
}

variable "chart_version" {
  description = "Cert-manager helm chart version"
  type        = string
  default     = "v1.20.0"
}

variable "email" {
  description = "Email for Let's Encrypt account"
  type        = string
}
