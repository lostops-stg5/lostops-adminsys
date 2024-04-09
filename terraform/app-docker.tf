# -----------------------------------------------------------------
#       Configuration for others tool's virtual machine
# -----------------------------------------------------------------

resource "azurerm_dev_test_linux_virtual_machine" "app_docker" {
  name                = "app-docker"
  lab_name            = data.azurerm_dev_test_lab.lostops_lab.name
  resource_group_name = data.azurerm_resource_group.lostops_ressource_group.name
  location            = data.azurerm_resource_group.lostops_ressource_group.location

  size                   = "Standard_A4_v2"
  username               = "admuser"
  ssh_key                = var.SSH_KEY
  lab_virtual_network_id = data.azurerm_dev_test_virtual_network.lostops_network.id
  lab_subnet_name        = data.azurerm_dev_test_virtual_network.lostops_network.name
  storage_type           = "Standard"
  notes                  = "The virtual machine used to host all of our tools, with DS2 machines type."

  allow_claim = true

  gallery_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  tags = {
    "group_number" : "2"
    "module" : "t-nsa-800"
  }
}

resource "local_file" "extension_docker_file" {
  content  = data.azurerm_storage_blob.docker_script.name
  filename = "script_docker"
}

resource "azurerm_virtual_machine_extension" "app_docker_extension" {
  name                 = "app-docker"
  virtual_machine_id   = azurerm_dev_test_linux_virtual_machine.app_database.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = base64decode(file(local_file.extension_docker_file.content))
}
