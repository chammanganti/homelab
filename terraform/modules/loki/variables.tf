variable "name" {
  description = "Loki name"
  type        = string
  default     = "loki"
}

variable "namespace" {
  description = "Namespace to install loki"
  type        = string
  default     = "monitoring"
}

variable "chart_version" {
  description = "Loki helm chart version"
  type        = string
  default     = "6.55.0"
}
