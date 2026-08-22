# Credentials come from variables.tofu (var.cloudflare_api_token), set via
# TF_VAR_* env vars — never hardcoded here.

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
