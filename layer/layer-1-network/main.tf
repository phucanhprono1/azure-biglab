
data "terraform_remote_state" "layer_0" {
  backend = "local"
  config = {
    path = "../layer-0-resource-group/terraform.tfstate"
  }
}

resource "azurerm_virtual_network" "lab_vnet" {
  name                = "lab1-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = data.terraform_remote_state.layer_0.outputs.location
  resource_group_name = data.terraform_remote_state.layer_0.outputs.resource_group_name
}
# Application Gateway Subnet
resource "azurerm_subnet" "appgw_subnet" {
  name                 = "appgw-subnet"
  resource_group_name  = data.terraform_remote_state.layer_0.outputs.resource_group_name
  virtual_network_name = azurerm_virtual_network.lab_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# App Service Integration Subnet
resource "azurerm_subnet" "integration_subnet" {
  name                 = "integration-subnet"
  resource_group_name  = data.terraform_remote_state.layer_0.outputs.resource_group_name
  virtual_network_name = azurerm_virtual_network.lab_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
  delegation {
    name = "app-service-delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}

# Private Endpoint Subnet
resource "azurerm_subnet" "private_endpoint_subnet" {
  name                                          = "private-endpoint-subnet"
  resource_group_name                           = data.terraform_remote_state.layer_0.outputs.resource_group_name
  virtual_network_name                          = azurerm_virtual_network.lab_vnet.name
  address_prefixes                              = ["10.0.3.0/24"]
  private_link_service_network_policies_enabled = true
}

# Network Security Group for Application Gateway
resource "azurerm_network_security_group" "appgw_nsg" {
  name                = "appgw-nsg"
  location            = data.terraform_remote_state.layer_0.outputs.location
  resource_group_name = data.terraform_remote_state.layer_0.outputs.resource_group_name

  security_rule {
    name                       = "Allow_GWM"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range         = "*"
    destination_port_range    = "65200-65535"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow_HTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range         = "*"
    destination_port_range    = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow_HTTPS"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range         = "*"
    destination_port_range    = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate NSG with Application Gateway subnet
resource "azurerm_subnet_network_security_group_association" "appgw_nsg_association" {
  subnet_id                 = azurerm_subnet.appgw_subnet.id
  network_security_group_id = azurerm_network_security_group.appgw_nsg.id
}

