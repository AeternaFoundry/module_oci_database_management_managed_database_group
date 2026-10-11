resource "oci_database_management_managed_database_group" "database_management_managed_database_groups" {
  for_each = var.database_management_managed_database_groups

  compartment_id = each.value.compartment_id
  name           = each.value.name
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  freeform_tags  = each.value.freeform_tags

  dynamic "managed_databases" {
    for_each = each.value.managed_databases != null ? each.value.managed_databases : []
    content {
      compartment_id = managed_databases.value.compartment_id
      id             = managed_databases.value.id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

