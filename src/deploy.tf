module "network" {
  source = "./modules/networking"

  network_security_group_name = var.network_security_group_name
  resource_group_name         = var.resource_group_name
  resource_group_location     = var.location
  virtual_network_name        = var.virtual_network_name
  tags                        = var.tags
}
