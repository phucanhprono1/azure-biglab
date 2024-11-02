resource "azurerm_public_ip" "public_ip" {
  name                = "agw-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_application_gateway" "main" {
  location            = var.location
  name                = "main-application-gateway"
  resource_group_name = var.resource_group_name
  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = var.sku_capacity
  }
  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = var.gateway_subnet_id
  }
  frontend_port {
    name = "http-port"
    port = 80
  }
  frontend_ip_configuration {
    name                 = "frontend"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
  backend_address_pool {
    name = "backend-pool"
  }
  backend_http_settings {
    cookie_based_affinity = "Disabled"
    name                  = "http-settings"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }
  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "frontend"
    frontend_port_name             = "http-port"
    protocol                       = "Http"
  }
  request_routing_rule {
    name                       = "http-rule"
    priority                   = 1
    rule_type                  = "Basic"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "http-settings"

  }
}