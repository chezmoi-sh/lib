# chezmoi.sh - DNS module

This Terraform module manages DNS records for chezmoi.sh in a normalised way across
all environments _(with comments and tags to help identify the source of the record)_.

<!-- BEGIN_TF_DOCS -->

## Example

```hcl
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
```

## Inputs

| Name                                                   | Description                           | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Default | Required |
| ------------------------------------------------------ | ------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_project"></a> [project](#input_project) | Project that this resource belongs to | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | n/a     |   yes    |
| <a name="input_records"></a> [records](#input_records) | Cloudflare DNS records to create      | <pre>list(object({<br> name = string<br> type = string<br> value = optional(string)<br><br> ttl = optional(number, 300)<br> proxied = optional(bool, false)<br> priority = optional(number)<br><br> comment = optional(string)<br><br> data = optional(list(object({<br> algorithm = optional(number)<br> altitude = optional(number)<br> certificate = optional(string)<br> content = optional(string)<br> digest = optional(string)<br> digest_type = optional(number)<br> fingerprint = optional(string)<br> flags = optional(string)<br> key_tag = optional(number)<br> lat_degrees = optional(number)<br> lat_direction = optional(string)<br> lat_minutes = optional(number)<br> lat_seconds = optional(number)<br> long_degrees = optional(number)<br> long_direction = optional(string)<br> long_minutes = optional(number)<br> long_seconds = optional(number)<br> matching_type = optional(number)<br> name = optional(string)<br> order = optional(number)<br> port = optional(number)<br> precision_horz = optional(number)<br> precision_vert = optional(number)<br> preference = optional(number)<br> priority = optional(number)<br> proto = optional(string)<br> protocol = optional(number)<br> public_key = optional(string)<br> regex = optional(string)<br> replacement = optional(string)<br> selector = optional(number)<br> service = optional(string)<br> size = optional(number)<br> tag = optional(string)<br> target = optional(string)<br> type = optional(number)<br> usage = optional(number)<br> value = optional(string)<br> weight = optional(number)<br> })), [])<br> }))</pre> | n/a     |   yes    |
| <a name="input_zone_id"></a> [zone_id](#input_zone_id) | Cloudflare DNS zone ID                | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | n/a     |   yes    |

## Outputs

| Name                                                     | Description                    |
| -------------------------------------------------------- | ------------------------------ |
| <a name="output_records"></a> [records](#output_records) | Cloudflare DNS records created |

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_cloudflare"></a> [cloudflare](#provider_cloudflare) | 4.22.0  |

<!-- END_TF_DOCS -->
