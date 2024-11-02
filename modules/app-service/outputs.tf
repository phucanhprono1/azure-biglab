output "app_service_plan_id" {
  value = azurerm_service_plan.service-plan.id
  description = "The ID of app service plan"
}
output "app_service_name" {
  value = azurerm_linux_web_app.linux-web-app.name
  description = "Name of created app services"
}
output "app_service_default_hostname" {
  value = azurerm_linux_web_app.linux-web-app[*].default_hostname
  description = "Default host name of created app services"
}