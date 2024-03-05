# -----------------------------------------------------------------
#       All ressources that need to be pulled from lab
# -----------------------------------------------------------------

data "azurerm_dev_test_lab" "lostops_lab" {
  name                = var.dev_lab_name
  resource_group_name = data.azurerm_resource_group.lostops_ressource_group.name
}

data "azurerm_resource_group" "lostops_ressource_group" {
  name = var.ressource_group_name
}
