provider "cloudflare" {
  email   = "your_cloudflare_email@example.com"
  api_key = "0000000000000000000000000000000000000"
}

module "cloudflare_dns" {
  source  = "../.."
  project = "example.com"
  zone_id = "your_cloudflare_zone_id"

  records = [
    {
      name     = "example.com"
      type     = "A"
      value    = "192.168.1.1"
      ttl      = 3600
      proxied  = true
      priority = 10

      tags = {
        environment = "production"
      }

      data = [
        {
          protocol = 6
          port     = 80
          target   = "webserver"
        },
        {
          protocol = 17
          port     = 53
          target   = "dns-server"
        }
      ]
    },
    {
      name  = "subdomain.example.com"
      type  = "CNAME"
      value = "example.com"
      ttl   = 3600
    },
  ]
}