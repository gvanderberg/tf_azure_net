terraform {
  backend "remote" {}
}

module "rg" {
  source = "./modules/resource_group"

  resource_group_create   = var.resource_group_create
  resource_group_name     = var.resource_group_name
  resource_group_location = var.location
  tags                    = var.tags
}

module "net" {
  source = "./modules/virtual_network"

  resource_group_name     = module.rg.name
  resource_group_location = module.rg.location
  address_space           = [var.address_space]
  subnet_name_prefix      = var.subnet_name_prefix
  virtual_network_name    = var.virtual_network_name
  tags                    = var.tags
}
