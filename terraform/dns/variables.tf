variable "project" {
  type        = string
  description = "Project that this resource belongs to"
}

variable "zone_id" {
  type        = string
  description = "Cloudflare DNS zone ID"
  sensitive   = true
}

variable "records" {
  description = "Cloudflare DNS records to create"
  type = list(object({
    name  = string
    type  = string
    value = optional(string)

    ttl      = optional(number, 300)
    proxied  = optional(bool, false)
    priority = optional(number)

    tags = optional(map(string))

    data = optional(list(object({
      algorithm      = optional(number)
      altitude       = optional(number)
      certificate    = optional(string)
      content        = optional(string)
      digest         = optional(string)
      digest_type    = optional(number)
      fingerprint    = optional(string)
      flags          = optional(string)
      key_tag        = optional(number)
      lat_degrees    = optional(number)
      lat_direction  = optional(string)
      lat_minutes    = optional(number)
      lat_seconds    = optional(number)
      long_degrees   = optional(number)
      long_direction = optional(string)
      long_minutes   = optional(number)
      long_seconds   = optional(number)
      matching_type  = optional(number)
      name           = optional(string)
      order          = optional(number)
      port           = optional(number)
      precision_horz = optional(number)
      precision_vert = optional(number)
      preference     = optional(number)
      priority       = optional(number)
      proto          = optional(string)
      protocol       = optional(number)
      public_key     = optional(string)
      regex          = optional(string)
      replacement    = optional(string)
      selector       = optional(number)
      service        = optional(string)
      size           = optional(number)
      tag            = optional(string)
      target         = optional(string)
      type           = optional(number)
      usage          = optional(number)
      value          = optional(string)
      weight         = optional(number)
    })))
  }))

  validation {
    condition     = alltrue([for r in var.records : can(r.value) || can(r.data)])
    error_message = "Either 'value' or 'data' must be set."
  }

  validation {
    condition     = alltrue([for r in var.records : can(r.value) && can(r.data)])
    error_message = "Only 'value' or 'data' can be set, not both."
  }
}
