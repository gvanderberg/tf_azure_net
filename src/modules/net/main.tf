# resource "azurerm_network_security_group" "this" {
#   name                = var.network_security_group_name
#   location            = azurerm_resource_group.this.location
#   resource_group_name = azurerm_resource_group.this.name
#   tags                = var.tags
#   depends_on          = [azurerm_resource_group.this]
# }

resource "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "GatewaySubnet"
    address_prefix = "10.0.1.0/24"
    # security_group = azurerm_network_security_group.this.id
  }

  subnet {
    name           = "azsnet-prd-zn-dmz"
    address_prefix = "10.0.2.0/24"
    # security_group = azurerm_network_security_group.this.id
  }

  subnet {
    name           = "azsnet-prd-zn-edmz"
    address_prefix = "10.0.3.0/24"
    # security_group = azurerm_network_security_group.this.id
  }

  subnet {
    name           = "azsnet-prd-zn-lan"
    address_prefix = "10.0.4.0/24"
    # security_group = azurerm_network_security_group.this.id
  }

  subnet {
    name           = "azsnet-prd-zn-k8s"
    address_prefix = "10.0.5.0/23"
    # security_group = azurerm_network_security_group.this.id
  }

  tags = var.tags
  # depends_on = [azurerm_resource_group.this]
}
