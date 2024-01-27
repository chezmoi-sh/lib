output "records" {
  description = "Cloudflare DNS records created"
  sensitive   = false
  value = {
    for record in cloudflare_record.this : record.hostname => record.id
  }
}
