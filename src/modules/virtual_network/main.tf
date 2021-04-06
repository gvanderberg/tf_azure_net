locals {
  subnets = tolist([
    {
      name                           = "GatewaySubnet"
      address                        = cidrsubnet(var.address_space, "8", "1")
      private_link_endpoint_policies = false
      service_endpoints              = []
    },
    {
      name                           = format(var.subnet_name_prefix, "dmz")
      address                        = cidrsubnet(var.address_space, "7", "1")
      private_link_endpoint_policies = false
      service_endpoints              = []
    },
    {
      name                           = format(var.subnet_name_prefix, "edmz")
      address                        = cidrsubnet(var.address_space, "7", "2")
      private_link_endpoint_policies = false
      service_endpoints              = []
    },
    {
      name                           = format(var.subnet_name_prefix, "lan")
      address                        = cidrsubnet(var.address_space, "7", "3")
      private_link_endpoint_policies = true
      service_endpoints              = ["Microsoft.ContainerRegistry", "Microsoft.KeyVault", "Microsoft.Storage"]
    },
    {
      name                           = format(var.subnet_name_prefix, "k8s")
      address                        = cidrsubnet(var.address_space, "6", "2")
      private_link_endpoint_policies = false
      service_endpoints              = ["Microsoft.ContainerRegistry", "Microsoft.KeyVault", "Microsoft.Storage"]
    }
  ])
}

resource "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
  tags                = var.tags
}

resource "azurerm_subnet" "this" {
  count = length(local.subnets)

  name                                           = local.subnets[count.index].name
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.this.name
  address_prefixes                               = [local.subnets[count.index].address]
  enforce_private_link_endpoint_network_policies = local.subnets[count.index].private_link_endpoint_policies
  service_endpoints                              = local.subnets[count.index].service_endpoints

  depends_on = [azurerm_virtual_network.this]
}

# resource "azurerm_network_security_group" "this" {
#   count = length(local.subnets)

#   name                = local.subnets[count.index].security_group_name
#   location            = var.resource_group_location
#   resource_group_name = var.resource_group_name
#   tags                = var.tags
# }

# resource "azurerm_subnet_network_security_group_association" "this" {
#   count = length(azurerm_subnet.this)

#   subnet_id                 = azurerm_subnet.this[count.index].id
#   network_security_group_id = azurerm_network_security_group.this[count.index].id

#   depends_on = [azurerm_subnet.this, azurerm_network_security_group.this]
# }
