resource "azurerm_storage_account" "lostops_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.lostops_ressource_group.name
  location                 = data.azurerm_resource_group.lostops_ressource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_storage_container" "state_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.lostops_storage_account.name
  container_access_type = "private"
}
