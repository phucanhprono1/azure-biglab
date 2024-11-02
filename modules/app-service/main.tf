resource "azurerm_service_plan" "service-plan" {
  location            = var.location
  name                = var.app_service_plan_name
  os_type             = var.app_service_plan_sku
  resource_group_name = var.resource_group_name
  sku_name            = "P1v2"
}
resource "azurerm_linux_web_app" "linux-web-app" {
  count = var.app-service-zones
  location            = var.location
  name                = "linux-web-app-zone-${count.index + 1}"
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.service-plan.id

  site_config {}

}