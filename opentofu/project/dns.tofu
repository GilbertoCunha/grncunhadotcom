# Points grncunha.com at this repo's GitHub Pages site.
#
# The apex can't use a CNAME: DNS doesn't allow a CNAME to coexist with other
# record types at the same name, and grncunha.com already carries MX/TXT
# records for email — so per GitHub's own docs, the apex needs A records
# pointing at GitHub Pages' IPs instead:
# https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site
#
# GitHub determines which repo (github.io/grncunhadotcom) to serve for this
# hostname from the custom domain configured in the repo's Pages settings
# (Settings → Pages → Custom domain), matched via the CNAME file committed at
# public/CNAME.
#
# proxied = false (DNS only) is required here: GitHub Pages' custom-domain
# check does a live DNS lookup and expects to resolve straight through to
# GitHub's IPs. Proxying (orange cloud) puts Cloudflare's own IPs in the
# response instead, which GitHub can't verify — it then reports the domain as
# "improperly configured" even though the record itself is correct. GitHub
# Pages provisions and terminates its own HTTPS cert for the domain, so
# Cloudflare's proxy isn't needed for TLS here either.
locals {
  # GitHub Pages' documented apex IPv4 addresses.
  github_pages_ips = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}

resource "cloudflare_dns_record" "github_pages" {
  for_each = toset(local.github_pages_ips)

  zone_id = var.cloudflare_zone_id
  name    = "grncunha.com"
  type    = "A"
  content = each.value
  ttl     = 1
  proxied = false
}

# GitHub Pages also checks the www subdomain when the custom domain is set to
# an apex, so it can offer the automatic apex <-> www redirect. Same DNS-only
# requirement as above, for the same reason.
resource "cloudflare_dns_record" "github_pages_www" {
  zone_id = var.cloudflare_zone_id
  name    = "www.grncunha.com"
  type    = "CNAME"
  content = "gilbertocunha.github.io"
  ttl     = 1
  proxied = false
}
