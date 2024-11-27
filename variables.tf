variable "cloudflare_api_token" {
  sensitive   = true
  type        = string
  description = "Prefix of domain"
}

variable "cloudflare_account_id" {
  sensitive   = false
  type        = string
  description = "Cloudflare Account ID"
}
