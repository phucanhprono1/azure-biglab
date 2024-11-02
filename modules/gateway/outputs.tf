output "application_gateway_id" {
  value       = azurerm_application_gateway.main.id
  description = "ID of the Application Gateway"
}

output "public_ip_address" {
  value       = azurerm_public_ip.public_ip.ip_address
  description = "Public IP address of the Application Gateway"
}

output "backend_pool_id" {
  value       = azurerm_application_gateway.main.backend_address_pool[0].id
  description = "ID of the backend address pool"
}