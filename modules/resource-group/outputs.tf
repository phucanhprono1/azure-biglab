output "resource_group_name" {
  value       = azurerm_resource_group.resourcegroup.name
  description = "The name of the resource group"
}

output "location" {
  value       = azurerm_resource_group.resourcegroup.location
  description = "The location of the resource group"
}
