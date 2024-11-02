output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "ID of the created virtual network"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "Name of the created virtual network"
}

output "subnet_ids" {
  value       = { for k, v in azurerm_subnet.subnets : k => v.id }
  description = "Map of subnet names to subnet IDs"
}

output "gateway_subnet_id" {
  value       = azurerm_subnet.subnets["gateway"].id
  description = "ID of the gateway subnet"
}
output "integration_subnet_id" {
  value = azurerm_subnet.subnets["integration"].id
  description = "Id of the integration subnet"
}
output "private_endpoint_subnet_id" {
  value = azurerm_subnet.subnets["private_endpoints"].id
  description = "ID of the private endpoint subnet"
}
