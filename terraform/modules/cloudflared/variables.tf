variable "name" {
  description = "Cloudflared name"
  type        = string
  default     = "cloudflared"
}

variable "namespace" {
  description = "Namespace to install cloudflared"
  type        = string
  default     = "cloudflared"
}

variable "chart_version" {
  description = "Cloudflared helm chart version"
  type        = string
  default     = "0.3.2"
}

variable "account" {
  description = "Cloudflare account number"
  type        = string
  sensitive   = true
}

variable "tunnel_name" {
  description = "Cloudflare tunnel name"
  type        = string
}

variable "tunnel_id" {
  description = "Cloudflare tunnel id"
  type        = string
  sensitive   = true
}

variable "secret" {
  description = "Cloudflare tunnel secret"
  type        = string
  sensitive   = true
}
