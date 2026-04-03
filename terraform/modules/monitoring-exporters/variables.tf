variable "namespace" {
  description = "Namespace to install the exporters"
  type        = string
  default     = "monitoring"
}

variable "node_exporter_version" {
  description = "Node exporter helm chart version"
  type        = string
  default     = "4.52.2"
}

variable "kube_state_metrics_version" {
  description = "Kube state metrics helm chart version"
  type        = string
  default     = "7.2.2"
}

variable "promtail_version" {
  description = "Promtail helm chart version"
  type        = string
  default     = "6.17.1"
}

variable "loki_url" {
  type        = string
  description = "Loki service URL"
}
