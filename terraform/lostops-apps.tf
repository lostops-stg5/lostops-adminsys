# -----------------------------------------------------------------
#       Configuration for web app virtual machine
# -----------------------------------------------------------------

resource "azurerm_dev_test_linux_virtual_machine" "lostops_app" {
  name                = "lostops-app"
  lab_name            = data.azurerm_dev_test_lab.lostops_lab.name
  resource_group_name = data.azurerm_resource_group.lostops_ressource_group.name
  location            = data.azurerm_resource_group.lostops_ressource_group.location

  size                   = "Standard_DS1"
  username               = "nsa800"
  ssh_key                = file("~/.ssh/id_rsa.pub")
  lab_virtual_network_id = azurerm_dev_test_virtual_network.lostops_network.id
  lab_subnet_name        = azurerm_dev_test_virtual_network.lostops_network.subnet[0].name
  storage_type           = "Standard"
  notes                  = "The virtual machine used to host web app, with DS1 machines type."

  allow_claim = true

  tags = {
    "environnement" : "Production"
    "service" : "application"
  }

  gallery_image_reference {
    publisher = "Debian"
    offer     = "debian-11"
    sku       = "11-backports-gen2"
    version   = "latest"
  }
}
