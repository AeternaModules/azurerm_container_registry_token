output "container_registry_tokens" {
  description = "All container_registry_token resources"
  value       = azurerm_container_registry_token.container_registry_tokens
}
output "container_registry_tokens_container_registry_name" {
  description = "List of container_registry_name values across all container_registry_tokens"
  value       = [for k, v in azurerm_container_registry_token.container_registry_tokens : v.container_registry_name]
}
output "container_registry_tokens_enabled" {
  description = "List of enabled values across all container_registry_tokens"
  value       = [for k, v in azurerm_container_registry_token.container_registry_tokens : v.enabled]
}
output "container_registry_tokens_name" {
  description = "List of name values across all container_registry_tokens"
  value       = [for k, v in azurerm_container_registry_token.container_registry_tokens : v.name]
}
output "container_registry_tokens_resource_group_name" {
  description = "List of resource_group_name values across all container_registry_tokens"
  value       = [for k, v in azurerm_container_registry_token.container_registry_tokens : v.resource_group_name]
}
output "container_registry_tokens_scope_map_id" {
  description = "List of scope_map_id values across all container_registry_tokens"
  value       = [for k, v in azurerm_container_registry_token.container_registry_tokens : v.scope_map_id]
}

