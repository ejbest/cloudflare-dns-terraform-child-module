data "cloudflare_zone" "zone" {
  name = var.cloudflare_zone_id
}

resource "cloudflare_record" "record" {
  zone_id = data.cloudflare_zone.zone.id
  name    = var.cloudflare_name
  content = var.cloudflare_content
  type    = var.cloudflare_type
  ttl     = var.ttl
  proxied = var.proxied
}
