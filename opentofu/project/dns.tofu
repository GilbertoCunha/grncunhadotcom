# Points grncunha.com at this repo's GitHub Pages site.
#
# The record's content is just the GitHub Pages hostname (gilbertocunha.github.io) —
# a DNS CNAME can only target a hostname, not a full URL with scheme/path. GitHub
# determines which repo (github.io/grncunhadotcom) to serve for this hostname from
# the custom domain configured in the repo's Pages settings (Settings → Pages →
# Custom domain), matched via the CNAME file committed at public/CNAME.
#
# proxied = true routes the domain through Cloudflare (CDN + automatic HTTPS)
# instead of connecting straight to GitHub's edge.
resource "cloudflare_dns_record" "github_pages" {
  zone_id = var.cloudflare_zone_id
  name    = "grncunha.com"
  type    = "CNAME"
  content = "gilbertocunha.github.io"
  ttl     = 1 # auto, only meaningful when proxied = false
  proxied = true
}
