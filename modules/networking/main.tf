resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.address_prefix]
}
resource "azurerm_network_interface" "nic" {
  name = "my-nic"
  location = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "myipconfig"
    subnet_id = azurerm_subnet.subnets["integration"].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = "ddos-protection-plan"
  location           = var.location
  resource_group_name = var.resource_group_name
}