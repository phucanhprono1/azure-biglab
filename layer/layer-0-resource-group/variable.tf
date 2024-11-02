# layer/layer-0-resource-group/variables.tf
variable "resource_group_name" {
  description = "Name of the resource group for layer-0."
  type        = string
}

variable "location" {
  description = "Azure region for the resource group."
  type        = string
  default     = "East US" # Change as needed
}

variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
  
}