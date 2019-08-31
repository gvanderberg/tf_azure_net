provider "azurerm" {
  version = "1.33.1"
}

module "network" {
  source = "../modules/networking"

  network_security_group_name = "aznsg-prd-zn-titansoft"
  resource_group_location     = "southafricanorth"
  resource_group_name         = "azrg-prd-zn-vnet"
  virtual_network_name        = "azvnet-prd-zn-titansoft"
  tags                        = { createdBy = "Terraform", environment = "Production", managedBy = "gvanderberg@titansoftware.co.za" }
}
