data "azurerm_subnet" "this" {
  name                 = "GatewaySubnet"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

resource "random_integer" "this" {
  min = 1000
  max = 5000
}

resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  tags                = var.tags
}

resource "azurerm_virtual_network_gateway" "this" {
  name                = var.virtual_network_gateway_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = format("ipconfig-%s", random_integer.this.result)
    public_ip_address_id          = azurerm_public_ip.this.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.this.id
  }

  tags       = var.tags
  depends_on = [azurerm_public_ip.this]
}
