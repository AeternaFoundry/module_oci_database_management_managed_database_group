variable "database_management_managed_database_groups" {
  description = <<EOT
Map of database_management_managed_database_groups, attributes below
Required:
    - compartment_id
    - name
Optional:
    - defined_tags
    - description
    - freeform_tags
    - managed_databases (block):
        - compartment_id (optional)
        - id (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    name           = string
    defined_tags   = optional(map(string))
    description    = optional(string)
    freeform_tags  = optional(map(string))
    managed_databases = optional(list(object({
      compartment_id = optional(string)
      id             = optional(string)
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

