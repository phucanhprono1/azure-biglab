resource "azurerm_storage_account" "storage_account" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = var.location
  name                     = "my-storage-account"
  resource_group_name      = var.resource_group_name
}
resource "azurerm_storage_container" "storage_container" {
  name                  = "my-storage-container"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}
resource "azurerm_storage_blob" "storage_blob" {
  name                   = "my-storage-blob"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
}