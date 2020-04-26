data "azurerm_subnet" "this" {
  name                 = "GatewaySubnet"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags                = var.tags
}

resource "azurerm_virtual_network_gateway" "this" {
  name                = var.gateway_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "azvng-prd-zn-titansoft-config"
    public_ip_address_id          = azurerm_public_ip.this.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.this.id
  }

  tags = var.tags
}
