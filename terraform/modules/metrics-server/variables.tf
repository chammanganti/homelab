variable "name" {
  description = "Metrics-server name"
  type        = string
  default     = "metrics-server"
}

variable "namespace" {
  description = "Namespace to install metrics-server"
  type        = string
  default     = "kube-system"
}

variable "chart_version" {
  description = "Metrics-server helm chart version"
  type        = string
  default     = "3.13.0"
}
