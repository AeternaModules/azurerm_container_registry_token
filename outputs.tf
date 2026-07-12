output "container_registry_tokens_container_registry_name" {
  description = "Map of container_registry_name values across all container_registry_tokens, keyed the same as var.container_registry_tokens"
  value       = { for k, v in azurerm_container_registry_token.container_registry_tokens : k => v.container_registry_name }
}
output "container_registry_tokens_enabled" {
  description = "Map of enabled values across all container_registry_tokens, keyed the same as var.container_registry_tokens"
  value       = { for k, v in azurerm_container_registry_token.container_registry_tokens : k => v.enabled }
}
output "container_registry_tokens_name" {
  description = "Map of name values across all container_registry_tokens, keyed the same as var.container_registry_tokens"
  value       = { for k, v in azurerm_container_registry_token.container_registry_tokens : k => v.name }
}
output "container_registry_tokens_resource_group_name" {
  description = "Map of resource_group_name values across all container_registry_tokens, keyed the same as var.container_registry_tokens"
  value       = { for k, v in azurerm_container_registry_token.container_registry_tokens : k => v.resource_group_name }
}
output "container_registry_tokens_scope_map_id" {
  description = "Map of scope_map_id values across all container_registry_tokens, keyed the same as var.container_registry_tokens"
  value       = { for k, v in azurerm_container_registry_token.container_registry_tokens : k => v.scope_map_id }
}

