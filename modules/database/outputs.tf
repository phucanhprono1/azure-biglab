output "mysql_server_id" {
  value = azurerm_mysql_server.mysql-server.id
  description = "ID of MySQL server"
}
output "database_id" {
  value = azurerm_mysql_database.mysql-database.id
  description = "ID of the MySQL database"
}