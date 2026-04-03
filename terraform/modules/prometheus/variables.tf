variable "name" {
  description = "Prometheus name"
  type        = string
  default     = "prometheus"
}

variable "namespace" {
  description = "Namespace to install prometheus"
  type        = string
  default     = "monitoring"
}

variable "chart_version" {
  description = "Prometheus helm chart version"
  type        = string
  default     = "28.15.0"
}

variable "rpi_ip" {
  type        = string
  description = "Raspberry Pi node ip address"
}
