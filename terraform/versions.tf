terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
  required_version = "~> 1.7.1"
}

provider "azurerm" {
  features {

  }
}


