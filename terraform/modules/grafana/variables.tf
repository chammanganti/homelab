variable "name" {
  description = "Grafana"
  type        = string
  default     = "grafana"
}

variable "namespace" {
  description = "Namespace to install grafana"
  type        = string
  default     = "monitoring"
}

variable "chart_version" {
  description = "Grafana helm chart version"
  type        = string
  default     = "10.5.15"
}

variable "prometheus_url" {
  type        = string
  description = "Prometheus service URL"
}

variable "loki_url" {
  type        = string
  description = "Loki service URL"
}
