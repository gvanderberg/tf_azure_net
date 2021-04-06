locals {
  subnets = tolist([
    {
      name    = "GatewaySubnet"
      address = cidrsubnet(var.address_space, "8", "1")
    },
    {
      name    = format(var.subnet_name_prefix, "dmz")
      address = cidrsubnet(var.address_space, "7", "1")
    },
    {
      name    = format(var.subnet_name_prefix, "edmz")
      address = cidrsubnet(var.address_space, "7", "2")
    },
    {
      name    = format(var.subnet_name_prefix, "lan")
      address = cidrsubnet(var.address_space, "7", "3")
    },
    {
      name    = format(var.subnet_name_prefix, "k8s")
      address = cidrsubnet(var.address_space, "6", "2")
    }
  ])
}

# resource "azurerm_network_security_group" "this" {
#   name                = var.network_security_group_name
#   location            = azurerm_resource_group.this.location
#   resource_group_name = azurerm_resource_group.this.name

#   tags = var.tags
# }

resource "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]

  dynamic "subnet" {
    for_each = local.subnets
    content {
      name           = subnet.value["name"]
      address_prefix = subnet.value["address"]
    }
  }

  tags = var.tags
}
