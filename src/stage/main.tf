provider "azurerm" {
  version = "1.33.1"

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

module "network" {
  source = "../modules/networking"

  network_security_group_name = "aznsg-dev-zn-titansoft"
  resource_group_location     = "southafricanorth"
  resource_group_name         = "azrg-dev-zn-vnet"
  virtual_network_name        = "azvnet-dev-zn-titansoft"
  tags                        = { createdBy = "Terraform", environment = "Development", managedBy = "gvanderberg@titansoftware.co.za" }
}
