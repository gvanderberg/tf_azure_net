module "rg" {
  source = "./modules/rg"

  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tags
}

module "vnet" {
  source = "./modules/vnet"

  resource_group_name     = module.rg.name
  resource_group_location = module.rg.location
  virtual_network_name    = var.virtual_network_name
  tags                    = var.tags
}

module "vngw" {
  source = "./modules/vngw"

  gateway_name            = var.gateway_name
  resource_group_name     = module.rg.name
  resource_group_location = module.rg.location
  public_ip_name          = var.public_ip_name
  virtual_network_name    = var.virtual_network_name
  tags                    = var.tags
}
