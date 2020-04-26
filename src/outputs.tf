output "resource_group_id" {
  value = module.rg.id
}

output "resource_group_location" {
  value = module.rg.location
}

output "virtual_network_id" {
  value = module.vnet.id
}

output "virtual_network_name" {
  value = module.vnet.name
}

output "virtual_network_address_space" {
  value = module.vnet.address_space
}
