variable "container_registry_tokens" {
  description = <<EOT
Map of container_registry_tokens, attributes below
Required:
    - container_registry_name
    - name
    - resource_group_name
    - scope_map_id
Optional:
    - enabled
EOT

  type = map(object({
    container_registry_name = string
    name                    = string
    resource_group_name     = string
    scope_map_id            = string
    enabled                 = optional(bool)
  }))
  validation {
    condition = alltrue([
      for k, v in var.container_registry_tokens : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registry_tokens : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registry_tokens : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registry_tokens : (
        length(v.container_registry_name) <= 50
      )
    ])
    error_message = "[from validate.ContainerRegistryName: invalid when len(value) > 50]"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

