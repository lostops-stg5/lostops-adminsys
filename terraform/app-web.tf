# -----------------------------------------------------------------
#       Configuration for web app virtual machine
# -----------------------------------------------------------------

resource "azurerm_dev_test_linux_virtual_machine" "app_web" {
  name                = "app-web"
  lab_name            = data.azurerm_dev_test_lab.lostops_lab.name
  resource_group_name = data.azurerm_resource_group.lostops_ressource_group_items.name
  location            = data.azurerm_resource_group.lostops_ressource_group_items.location

  size                   = "Standard_A4_v2"
  username               = "admuser"
  ssh_key                = var.SSH_KEY
  lab_virtual_network_id = data.azurerm_dev_test_virtual_network.lostops_network.id
  lab_subnet_name        = data.azurerm_dev_test_virtual_network.lostops_network.name
  storage_type           = "Standard"
  notes                  = "The virtual machine used to host web app, with DS1 machines type."

  allow_claim = true

  tags = {
    "group_number" : "2"
    "module" : "t-nsa-800"
  }

  gallery_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

# resource "local_file" "extension_web_file" {
#   content  = data.azurerm_storage_blob.web_script.name
#   filename = "script_web"
# }

# resource "azurerm_virtual_machine_extension" "app_web_extension" {
#   name                 = "app-web"
#   virtual_machine_id   = azurerm_dev_test_linux_virtual_machine.app_web.id
#   publisher            = "Microsoft.Azure.Extensions"
#   type                 = "CustomScript"
#   type_handler_version = "2.0"

#   settings = base64decode(file("./${local_file.extension_web_file.filename}"))
# }
