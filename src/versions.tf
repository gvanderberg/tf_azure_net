terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3"
    }
  }
  required_version = ">= 0.14"
}
