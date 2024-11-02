# layer/layer-0-resource-group/main.tf
module "resource_group" {
  source              = "../../modules/resource-group" # Path to the module
  resource_group_name = var.resource_group_name
  location            = var.location
}
