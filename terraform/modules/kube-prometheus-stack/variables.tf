variable "name" {
  description = "Kube-prometheus-stack name"
  type        = string
  default     = "kube-prometheus-stack"
}

variable "namespace" {
  description = "Namespace to install kube-prometheus-stack"
  type        = string
  default     = "monitoring"
}

variable "chart_version" {
  description = "Kube-prometheus-stack helm chart version"
  type        = string
  default     = "83.3.0"
}
