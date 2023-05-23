resource "cloudflare_record" "cf_record" {
  zone_id = var.cloudflare_zone_id
  name    = var.cloudflare_name
  value   = var.cloudflare_value
  type    = var.cloudflare_type
  ttl     = var.ttl
  proxied = var.proxied
}