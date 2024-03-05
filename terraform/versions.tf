terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "" # Not defined yet, because of VM waiting
    storage_account_name = "lostops_storage_account"
    container_name       = "tfstate_container"
    key                  = "prod.terraform.tfstate" # Not defined yet, because of VM waiting
  }

  required_version = "~> 1.7.1"
}

provider "azurerm" {
  features {

  }
}


