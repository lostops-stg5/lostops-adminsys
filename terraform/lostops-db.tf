# -----------------------------------------------------------------
#       Configuration for database virtual machine
# -----------------------------------------------------------------

resource "azurerm_dev_test_linux_virtual_machine" "lostops_database" {
  name                = "lostops-database"
  lab_name            = data.azurerm_dev_test_lab.lostops_lab.name
  resource_group_name = data.azurerm_resource_group.lostops_ressource_group.name
  location            = data.azurerm_resource_group.lostops_ressource_group.location

  size                   = "Standard_DS2"
  username               = "nsa800"
  ssh_key                = file("~/.ssh/id_rsa.pub")
  lab_virtual_network_id = azurerm_dev_test_virtual_network.lostops_network.id
  lab_subnet_name        = azurerm_dev_test_virtual_network.lostops_network.subnet[0].name
  storage_type           = "Standard"
  notes                  = "The virtual machine used to host application database of lostops app. Need huge performances, with DS2 machines type."

  allow_claim = true

  tags = {
    "environnement" : "Production"
    "service" : "database"
  }

  gallery_image_reference {
    publisher = "Debian"
    offer     = "debian-11"
    sku       = "11-backports-gen2"
    version   = "latest"
  }
}
