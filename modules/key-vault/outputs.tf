output "key_vault_id" {
  value = azurerm_key_vault.key-vault.id
  description = "The ID of key vault"
}
output "key_vault_uri" {
  value = azurerm_key_vault.key-vault.vault_uri
  description = "The URI of the Azure Key Vault"
}