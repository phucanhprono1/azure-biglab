# Outputs
output "vnet_id" {
  value = azurerm_virtual_network.lab_vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.lab_vnet.name
}

output "appgw_subnet_id" {
  value = azurerm_subnet.appgw_subnet.id
}

output "integration_subnet_id" {
  value = azurerm_subnet.integration_subnet.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoint_subnet.id
}