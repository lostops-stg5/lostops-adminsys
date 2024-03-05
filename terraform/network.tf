# -----------------------------------------------------------------
#       Network config for lostops project
# -----------------------------------------------------------------

resource "azurerm_dev_test_virtual_network" "lostops_network" {
  name                = "lostops-network"
  lab_name            = data.azurerm_dev_test_lab.lostops_lab.name
  resource_group_name = data.azurerm_resource_group.lostops_ressource_group.name
  description         = "The network used for the whole lostops application."

  tags = {
    "environnement" : "Production"
    "service" : "lostops-app"
  }

  subnet {
    use_public_ip_address           = "Allow"
    use_in_virtual_machine_creation = "Allow"
  }
}
