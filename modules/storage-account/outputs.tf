output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
  description = "The ID of storage account"
}
output "storage_account_primary_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
  sensitive   = true
  description = "The primary access key for the storage account."
}