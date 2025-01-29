data "cloudflare_zone" "zone" {
  name = var.cloudflare_zone_id
}

# resource "cloudflare_record" "record" {
#   zone_id = data.cloudflare_zone.zone.id
#   name    = var.cloudflare_name
#   content = var.cloudflare_content
#   type    = var.cloudflare_type
#   ttl     = var.ttl
#   proxied = var.proxied
# }

# resource "cloudflare_record" "record" {
#   for_each = var.dns_records

#   zone_id = data.cloudflare_zone.zone.id
#   name    = each.value.name
#   content = each.value.content
#   type    = each.value.type

#   ttl     = each.value.ttl
#   proxied = false

#   dynamic "priority" {https://github.com/ejbest/cloudflare-dns-terraform-module/edit/main/main.tf
#     for_each = each.value.type == "MX" && contains(keys(each.value), "priority") ? [each.value.priority] : []
#     content {
#       priority = priority.value
#     }
#   }
# }

resource "cloudflare_record" "record" {
  zone_id  = data.cloudflare_zone.zone.id
  name     = var.cloudflare_name
  content  = var.cloudflare_content
  type     = var.cloudflare_type
  ttl      = var.ttl
  proxied  = false
  priority = var.priority
}
