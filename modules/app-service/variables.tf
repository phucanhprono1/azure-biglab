variable "resource_group_name" {
  type = string
  description = "RG name in Azure"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "Southeast Asia"
}
variable "app-service-zones" {
  type        = number
  description = "Number of app service instances to create"
  default     = 3
}
variable "os" {
  type        = string
  description = "Operating system for the app service"
  default     = "Linux"
}
variable "app_service_plan_name" {
  type        = string
  description = "Name of the app service plan"
}
variable "app_service_plan_sku" {
  type        = string
  description = "SKU of the app service plan"
  
}