variable "name" {
  description = "Sealed Secrets name"
  type        = string
  default     = "sealed-secrets"
}

variable "namespace" {
  description = "Namespace to install Sealed Secrets"
  type        = string
  default     = "sealed-secrets"
}

variable "chart_version" {
  description = "Sealed Secrets helm chart version"
  type        = string
  default     = "2.18.4"
}
