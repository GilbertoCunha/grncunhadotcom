# Remote state on Cloudflare R2 (S3-compatible). The bucket itself is created
# manually in the Cloudflare dashboard (R2 Object Storage → Create bucket),
# the same way homelab-tofu-state was set up for the homelab repo — see that
# repo's docs/0-manual-setup.md#6-cloudflare-r2-for-opentofu-state.
#
# Credentials are never set here. The S3 backend reads them from the environment:
#   - AWS_ACCESS_KEY_ID
#   - AWS_SECRET_ACCESS_KEY
# (the AWS_* names are just what the S3 backend expects; these are R2 API token
# credentials, not AWS credentials)

terraform {
  backend "s3" {
    bucket = "grncunhadotcom-tofu-state"
    key    = "grncunhadotcom.tfstate"

    # R2 has no real AWS regions; this value is required by the backend but
    # unused beyond selecting the endpoint below.
    region = "auto"

    endpoints = {
      s3 = "https://465654cb42ab6be3f9902b6cf3b4b282.r2.cloudflarestorage.com"
    }

    use_path_style              = true
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

    # Requires the backend to support S3 conditional writes (If-None-Match).
    # R2 supports this natively, so native S3 state locking works as-is.
    use_lockfile = true
  }
}
