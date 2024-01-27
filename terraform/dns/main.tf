resource "cloudflare_record" "this" {
  for_each = { for record in var.records : record.name => record }

  zone_id = var.zone_id

  name  = each.value.name
  type  = each.value.type
  value = each.value.value

  ttl      = each.value.ttl
  proxied  = each.value.proxied
  priority = each.value.priority

  comment = "Managed by Terraform (chezmoi.sh|${var.project})"
  tags    = merge(each.value.tags, { "terraform_managed" = "true" })

  dynamic "data" {
    for_each = each.value.data
    content {
      algorithm      = try(data.value["algorithm"], null)
      altitude       = try(data.value["altitude"], null)
      certificate    = try(data.value["certificate"], null)
      content        = try(data.value["content"], null)
      digest         = try(data.value["digest"], null)
      digest_type    = try(data.value["digest_type"], null)
      fingerprint    = try(data.value["fingerprint"], null)
      flags          = try(data.value["flags"], null)
      key_tag        = try(data.value["key_tag"], null)
      lat_degrees    = try(data.value["lat_degrees"], null)
      lat_direction  = try(data.value["lat_direction"], null)
      lat_minutes    = try(data.value["lat_minutes"], null)
      lat_seconds    = try(data.value["lat_seconds"], null)
      long_degrees   = try(data.value["long_degrees"], null)
      long_direction = try(data.value["long_direction"], null)
      long_minutes   = try(data.value["long_minutes"], null)
      long_seconds   = try(data.value["long_seconds"], null)
      matching_type  = try(data.value["matching_type"], null)
      name           = try(data.value["name"], null)
      order          = try(data.value["order"], null)
      port           = try(data.value["port"], null)
      precision_horz = try(data.value["precision_horz"], null)
      precision_vert = try(data.value["precision_vert"], null)
      preference     = try(data.value["preference"], null)
      priority       = try(data.value["priority"], null)
      proto          = try(data.value["proto"], null)
      protocol       = try(data.value["protocol"], null)
      public_key     = try(data.value["public_key"], null)
      regex          = try(data.value["regex"], null)
      replacement    = try(data.value["replacement"], null)
      selector       = try(data.value["selector"], null)
      service        = try(data.value["service"], null)
      size           = try(data.value["size"], null)
      tag            = try(data.value["tag"], null)
      target         = try(data.value["target"], null)
      type           = try(data.value["type"], null)
      usage          = try(data.value["usage"], null)
      value          = try(data.value["value"], null)
      weight         = try(data.value["weight"], null)
    }
  }
}
