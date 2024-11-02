data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "key-vault" {
  location            = var.location
  name                = "my-key-vault"
  resource_group_name = var.resource_group_name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  soft_delete_retention_days = 7
  purge_protection_enabled    = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = ["Get"]
    secret_permissions = ["Get"]
    storage_permissions = ["Get"]
  }

}