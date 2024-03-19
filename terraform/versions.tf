terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "t-nsa-800-stg-2"
    storage_account_name = "atnsa800stg26523"
    container_name       = "tfstate-container"
    key                  = "prod.terraform.tfstate"
  }

  required_version = "~> 1.7.1"
}

provider "azurerm" {
  features {

  }
}


