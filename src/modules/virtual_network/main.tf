locals {
  subnets = [
    {
      name    = "GatewaySubnet"
      address = format(var.address_space, "1", "24")
    },
    {
      name    = format(var.subnet_name_prefix, "dmz")
      address = format(var.address_space, "10", "23")
    },
    {
      name    = format(var.subnet_name_prefix, "edmz")
      address = format(var.address_space, "20", "23")
    },
    {
      name    = format(var.subnet_name_prefix, "lan")
      address = format(var.address_space, "30", "23")
    },
    {
      name    = format(var.subnet_name_prefix, "k8s")
      address = format(var.address_space, "40", "22")
    }
  ]
}

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
  address_space       = [format(var.address_space, "0", "16")]

  dynamic "subnet" {
    for_each = local.subnets
    content {
      name           = subnet.value["name"]
      address_prefix = subnet.value["address"]
    }
  }

  tags = var.tags
}
