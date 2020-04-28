output "resource_group_id" {
  value = module.rg.id
}

output "resource_group_location" {
  value = module.rg.location
}

output "virtual_network_id" {
  value = module.net.id
}

output "virtual_network_name" {
  value = module.net.name
}

output "virtual_network_address_space" {
  value = module.net.address_space
}
