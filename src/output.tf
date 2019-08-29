output "resource_group_id" {
  value = azurerm_resource_group.this.id
}

output "resource_group_location" {
  value = azurerm_resource_group.this.location
}

output "azurerm_virtual_network_id" {
  value = azurerm_virtual_network.this.id
}

output "azurerm_virtual_network_name" {
  value = azurerm_virtual_network.this.name
}

output "azurerm_virtual_network_address_space" {
  value = azurerm_virtual_network.this.address_space
}
