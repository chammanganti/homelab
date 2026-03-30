variable "name" {
  description = "Argo CD name"
  type        = string
  default     = "argocd"
}

variable "namespace" {
  description = "Namespace to install argo cd"
  type        = string
  default     = "argocd"
}

variable "chart_version" {
  description = "Argo CD helm chart version"
  type        = string
  default     = "v3.3.6"
}

variable "domain" {
  type    = string
  default = "argocd.chammanganti.dev"
}

variable "tls_secret_name" {
  type    = string
  default = "wildcard-chammanganti-dev-tls"
}
