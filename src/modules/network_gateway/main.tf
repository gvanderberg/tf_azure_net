# data "azurerm_virtual_network_gateway" "this" {
#   count = var.virtual_network_gateway_create ? 0 : 1

#   name                = var.virtual_network_gateway_name
#   resource_group_name = var.resource_group_name
# }

resource "random_integer" "this" {
  count = var.virtual_network_gateway_create ? 1 : 0

  min = 1000
  max = 5000
}

data "azurerm_subnet" "this" {
  count = var.virtual_network_gateway_create ? 1 : 0

  name                 = "GatewaySubnet"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_public_ip" "this" {
  count = var.virtual_network_gateway_create ? 1 : 0

  name                = var.public_ip_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags                = var.tags
}

resource "azurerm_virtual_network_gateway" "this" {
  count = var.virtual_network_gateway_create ? 1 : 0

  name                = var.virtual_network_gateway_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  active_active       = false
  enable_bgp          = false
  sku                 = "Basic"
  type                = "Vpn"
  vpn_type            = "RouteBased"

  ip_configuration {
    name                          = format("ipconfig-%s", random_integer.this[count.index].result)
    public_ip_address_id          = azurerm_public_ip.this[count.index].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.this[count.index].id
  }

  tags       = var.tags
  depends_on = [azurerm_public_ip.this]
}
