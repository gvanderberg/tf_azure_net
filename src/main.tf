provider "azurerm" {
  features {}
  version = "=2.7.0"
}

terraform {
  required_version = "~>0.12.0"
  backend "remote" {}
}
