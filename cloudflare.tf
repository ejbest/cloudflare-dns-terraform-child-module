terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  api_token = "m-Y6A5fYOjd_eCNbEZdJoVdcyiPo5Fi2l6psPIz2"
}

variable "zone_id" {
  default = "bd6b1a5b365d69e2be7bfd0416767b5a"
}

variable "domain" {
  default = "auto-deploy.net"
}

resource "cloudflare_record" "www" {
  zone_id = var.zone_id
  name    = "www"
  value   = "108.35.155.143"
  type    = "A"
  proxied = true
}

# # Create a page rule
# resource "cloudflare_page_rule" "www" {
#   # ...
# }
