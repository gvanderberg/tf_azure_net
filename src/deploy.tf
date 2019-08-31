resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.region
  tags     = var.tags
}

resource "azurerm_network_security_group" "this" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = var.tags
  depends_on          = [azurerm_resource_group.this]
}

# resource "azurerm_virtual_network" "this" {
#   name                = var.virtual_network_name
#   location            = azurerm_resource_group.this.location
#   resource_group_name = azurerm_resource_group.this.name
#   address_space       = ["10.0.0.0/16"]
#   #dns_servers         = ["10.0.0.4", "10.0.0.5"]

#   ddos_protection_plan {
#     id     = azurerm_network_ddos_protection_plan.this.id
#     enable = true
#   }

#   subnet {
#     name           = "azsnet_dmz"
#     address_prefix = "10.0.1.0/24"
#   }

#   subnet {
#     name           = "azsnet_edmz"
#     address_prefix = "10.0.2.0/24"
#   }

#   subnet {
#     name           = "azsnet_lan"
#     address_prefix = "10.0.3.0/24"
#     security_group = azurerm_network_security_group.this.id
#   }

#   tags       = var.tags
#   depends_on = [azurerm_resource_group.this, azurerm_network_ddos_protection_plan.this, azurerm_network_security_group.this]
# }
