# -----------------------------------------------------------------
#       All ressources that need to be pulled from lab
# -----------------------------------------------------------------

# -----------------------------------------------------------------
#                     Dev test lab
# -----------------------------------------------------------------

data "azurerm_dev_test_lab" "lostops_lab" {
  name                = var.dev_lab_name
  resource_group_name = data.azurerm_resource_group.lostops_ressource_group.name
}

# -----------------------------------------------------------------
#                     Ressource groupes
# -----------------------------------------------------------------

data "azurerm_resource_group" "lostops_ressource_group" {
  name = var.ressource_group_name
}

data "azurerm_resource_group" "lostops_ressource_group_items" {
  name = var.ressource_group_name_items
}

# -----------------------------------------------------------------
#                     Network
# -----------------------------------------------------------------

data "azurerm_dev_test_virtual_network" "lostops_network" {
  name                = var.network_name
  lab_name            = var.dev_lab_name
  resource_group_name = var.ressource_group_name
}

# -----------------------------------------------------------------
#                     Storage
# -----------------------------------------------------------------

data "azurerm_storage_container" "artifact_storage_container" {
  name                 = var.storage_container_name
  storage_account_name = var.storage_account_name
}

data "azurerm_storage_blob" "database_script" {
  name                   = "template/resourcegroups/t-nsa-800-stg-2/labs/t-nsa-800-stg-2/virtualmachines/app-database/formula"
  storage_container_name = var.storage_container_name
  storage_account_name   = var.storage_account_name
}

data "azurerm_storage_blob" "docker_script" {
  name                   = "template/resourcegroups/t-nsa-800-stg-2/labs/t-nsa-800-stg-2/virtualmachines/app-docker/formula"
  storage_container_name = var.storage_container_name
  storage_account_name   = var.storage_account_name
}

data "azurerm_storage_blob" "web_script" {
  name                   = "template/resourcegroups/t-nsa-800-stg-2/labs/t-nsa-800-stg-2/virtualmachines/app-web/formula"
  storage_container_name = var.storage_container_name
  storage_account_name   = var.storage_account_name
}

