# layer/layer-0-resource-group/outputs.tf
output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "location" {
  value = module.resource_group.location
}
