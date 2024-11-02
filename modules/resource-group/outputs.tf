output "resource-group-name" {
  value = azurerm_resource_group.resourcegroup.name
  description = "Name of resource group"
}
output "resource-group-location" {
  value = azurerm_resource_group.resourcegroup.location
  description = "Resource group location"
}