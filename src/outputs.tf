output "resource_group_id" {
  value = module.vnet.resource_group_id
}

output "resource_group_location" {
  value = module.vnet.resource_group_location
}

output "network_security_group_id" {
  value = module.vnet.network_security_group_id
}

output "virtual_network_id" {
  value = module.vnet.virtual_network_id
}

output "virtual_network_name" {
  value = module.vnet.virtual_network_name
}

output "virtual_network_address_space" {
  value = module.vnet.virtual_network_address_space
}
