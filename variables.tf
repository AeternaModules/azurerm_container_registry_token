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
  # --- Unconfirmed validation candidates, derived from azurerm_container_registry_token's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.ContainerRegistryTokenName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: container_registry_name
  #   source:    [from validate.ContainerRegistryName] !regexp.MustCompile(`^[a-zA-Z0-9]+$`).MatchString(value)
  # path: container_registry_name
  #   source:    [from validate.ContainerRegistryName] 5 > len(value)
  # path: container_registry_name
  #   condition: length(value) <= 50
  #   message:   [from validate.ContainerRegistryName: invalid when len(value) > 50]
  #   source:    [from validate.ContainerRegistryName: invalid when len(value) > 50]
  # path: scope_map_id
  #   source:    [from scopemaps.ValidateScopeMapID] !ok
  # path: scope_map_id
  #   source:    [from scopemaps.ValidateScopeMapID] err != nil
}

