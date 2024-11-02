variable "resource_group_name" {
  type    = string
  description = "The name of resource group to deploy resources in."
}
variable "location" {
  type        = string
  description = "The location where all resources in this example should be provisioned."
}
variable "gateway_subnet_id" {
  type        = string
  description = "ID of the subnet for Application Gateway"
}
variable "sku_capacity" {
  type        = number
  description = "The Capacity of the Azure Application gateway"
  default = 2
}
