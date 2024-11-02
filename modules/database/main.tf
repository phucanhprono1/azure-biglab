resource "azurerm_mysql_server" "mysql-server" {
  location                = var.location
  name                    = "mysql-server"
  resource_group_name     = var.resource_group_name

  administrator_login      = var.administrator_login
  administrator_login_password = var.administrator_password

  sku_name   = "Standard_B1ms"
  version    = "5.7"
  ssl_enforcement_enabled = false
}
resource "azurerm_mysql_database" "mysql-database" {
  name                = "mysql-database"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql-server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}