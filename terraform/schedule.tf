# -----------------------------------------------------------------
#       Configuration for auto start and shutdown
# -----------------------------------------------------------------

resource "azurerm_dev_test_schedule" "auto_start" {
  name                = "LabAutoStart"
  location            = data.azurerm_resource_group.lostops_ressource_group.location
  resource_group_name = data.azurerm_resource_group.lostops_ressource_group.name
  lab_name            = data.azurerm_dev_test_lab.lostops_lab.name

  weekly_recurrence {
    time      = "0900"
    week_days = ["Monday", "Tuesday"]
  }

  time_zone_id = "Romance Standard Time"
  task_type    = "LabVmsStartupTask"

  notification_settings {
  }

  tags = {
    "environnement" : "Production"
    "service" : "lostops-app"
  }
}

resource "azurerm_dev_test_schedule" "auto_shutdown" {
  name                = "LabAutoStart"
  location            = data.azurerm_resource_group.lostops_ressource_group.location
  resource_group_name = data.azurerm_resource_group.lostops_ressource_group.name
  lab_name            = data.azurerm_dev_test_lab.lostops_lab.name

  weekly_recurrence {
    time      = "1800"
    week_days = ["Monday", "Tuesday"]
  }

  time_zone_id = "Romance Standard Time"
  task_type    = "LabVmsShutdownTask"

  notification_settings {
  }

  tags = {
    "environnement" : "Production"
    "service" : "lostops-app"
  }
}
