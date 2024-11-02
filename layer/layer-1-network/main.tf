
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