variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type = string
  sensitive = true
}

variable "ingest_ip" {
  description = "Ingest IP (spy.srv)"
  type = string
  default = "185.250.149.222"
}

variable "route" {
  description = "List of DNS records"
  type = map
  default = {
    data = {
      name = "data"
    },
    docker = {
      name = "docker"
    },
    git = {
      name = "git"
    },
    map = {
      name = "map"
    },
    push = {
      name = "push"
    },
    r = {
      name = "r"
    },
    secure = {
      name = "secure"
    }
  }
}
