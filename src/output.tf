output "resource_group_id" {
  value = azurerm_resource_group.this.id
}

output "resource_group_location" {
  value = azurerm_resource_group.this.location
}

output "network_ddos_protection_plan_id" {
  value = azurerm_network_ddos_protection_plan.this.id
}

output "network_ddos_protection_plan_virtual_network_ids" {
  value = azurerm_network_ddos_protection_plan.this.virtual_network_ids
}

output "network_security_group_id" {
  value = azurerm_network_security_group.this.id
}

# output "virtual_network_id" {
#   value = azurerm_virtual_network.this.id
# }

# output "virtual_network_name" {
#   value = azurerm_virtual_network.this.name
# }

# output "virtual_network_address_space" {
#   value = azurerm_virtual_network.this.address_space
# }
