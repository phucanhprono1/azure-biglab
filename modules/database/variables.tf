variable "resource_group_name" {
  type = string
  description = "RG name in Azure"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "Southeast Asia"
}
variable "administrator_login" {
  type = string
  description = "The administrator login name for the test MySQL Server"
}
variable "administrator_password" {
  type = string
  sensitive = true
  description = "The administrator password of the test MySQL Server"
}
variable "sku_name" {
  type = string
  description = "The Name of the SKU"
  default = "Standard_B1ms"
}
variable "database_name" {
  type = string
  description = "Name of the SQL Database within the Virtual MySQL Server"
}