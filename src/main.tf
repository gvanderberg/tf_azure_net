provider "azurerm" {
  version = "~>1.41.0"
}

terraform {
  required_version = "~>0.12.0"
  backend "remote" {}
}
