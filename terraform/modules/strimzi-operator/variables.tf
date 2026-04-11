variable "name" {
  description = "Strimzi-operator name"
  type        = string
  default     = "strimzi-operator"
}

variable "namespace" {
  description = "Namespace to install strimzi-operator"
  type        = string
  default     = "kafka"
}

variable "chart_version" {
  description = "Strimzi-operator helm chart version"
  type        = string
  default     = "0.51.0"
}
