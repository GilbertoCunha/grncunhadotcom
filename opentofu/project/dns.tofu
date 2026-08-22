# Points grncunha.com at this repo's GitHub Pages site.
#
# The record's content is just the GitHub Pages hostname (gilbertocunha.github.io) —
# a DNS CNAME can only target a hostname, not a full URL with scheme/path. GitHub
# determines which repo (github.io/grncunhadotcom) to serve for this hostname from
# the custom domain configured in the repo's Pages settings (Settings → Pages →
# Custom domain), matched via the CNAME file committed at public/CNAME.
#
# proxied = false (DNS only) is required here: GitHub Pages' custom-domain
# check does a live DNS lookup and expects to resolve straight through to
# gilbertocunha.github.io. Proxying (orange cloud) puts Cloudflare's own IPs
# in the response instead, which GitHub can't verify — it then reports the
# domain as "improperly configured" even though the record itself is correct.
# GitHub Pages provisions and terminates its own HTTPS cert for the domain,
# so Cloudflare's proxy isn't needed for TLS here either.
resource "cloudflare_dns_record" "github_pages" {
  zone_id = var.cloudflare_zone_id
  name    = "grncunha.com"
  type    = "CNAME"
  content = "gilbertocunha.github.io"
  ttl     = 1 # auto, only meaningful when proxied = false
  proxied = false
}
