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
