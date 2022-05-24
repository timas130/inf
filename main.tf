data "cloudflare_zone" "sitsh" {
  name = "sit.sh"
}
data "cloudflare_zone" "rddev" {
  name = "33rd.dev"
}

resource "cloudflare_record" "record_sitsh" {
  for_each = var.route
  zone_id = data.cloudflare_zone.sitsh.id
  name = each.value.name
  value = var.ingest_ip
  type = "A"
  ttl = 1 # auto
  proxied = false
}
resource "cloudflare_record" "record_33rddev" {
  for_each = var.route
  zone_id = data.cloudflare_zone.rddev.id
  name = each.value.name
  value = var.ingest_ip
  type = "A"
  ttl = 1 # auto
  proxied = false
  allow_overwrite = true
}

resource "cloudflare_record" "root_33rddev" {
  zone_id = data.cloudflare_zone.rddev.id
  name = "@"
  value = "apex-loadbalancer.netlify.com"
  type = "CNAME"
  ttl = 1 # auto
  proxied = false
  allow_overwrite = true
}
resource "cloudflare_record" "www_33rddev" {
  zone_id = data.cloudflare_zone.rddev.id
  name = "www"
  value = "elegant-jackson-fd7378.netlify.app"
  type = "CNAME"
  ttl = 1 # auto
  proxied = false
  allow_overwrite = true
}

resource "cloudflare_record" "root_sitsh" {
  zone_id = data.cloudflare_zone.sitsh.id
  name = "@"
  value = "apex-loadbalancer.netlify.com"
  type = "CNAME"
  ttl = 1 # auto
  proxied = false
}
resource "cloudflare_record" "www_sitsh" {
  zone_id = data.cloudflare_zone.sitsh.id
  name = "www"
  value = "elegant-jackson-fd7378.netlify.app"
  type = "CNAME"
  ttl = 1 # auto
  proxied = false
}
