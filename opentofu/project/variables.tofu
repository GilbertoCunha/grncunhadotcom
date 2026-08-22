# Values are never set here or in a committed .tfvars file — they're passed in
# via TF_VAR_cloudflare_api_token / TF_VAR_cloudflare_zone_id (or -var) at
# plan/apply time. Locally, export those env vars yourself; in CI, they come
# from GitHub Actions secrets.

variable "cloudflare_api_token" {
  description = "Cloudflare API token, scoped to DNS edit on the grncunha.com zone."
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Zone ID for grncunha.com (Cloudflare dashboard → domain overview → API section, right sidebar)."
  type        = string
}
