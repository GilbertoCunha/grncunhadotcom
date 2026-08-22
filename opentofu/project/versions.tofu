terraform {
  # >= 1.10 for native S3 state locking (use_lockfile in backend.tofu), no DynamoDB needed.
  required_version = ">= 1.10.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.23"
    }
  }
}
