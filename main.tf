data "cloudflare_zone" "zone" {
  name = var.cloudflare_zone_id
}

provider = var.provider

resource "cloudflare_record" "record" {
  zone_id = data.cloudflare_zone.zone.id
  name    = var.cloudflare_name
  value   = var.cloudflare_value
  type    = var.cloudflare_type
  ttl     = var.ttl
  proxied = var.proxied
}
