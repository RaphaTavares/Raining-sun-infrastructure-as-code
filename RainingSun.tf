resource "azurerm_resource_group" "Pandora_Box"{
    name = "pandora-box"
    location = "eastus2"
}

resource "azurerm_app_service_plan" "Pandora_App_Service_Plan" {
  name                = "pandora-app-service-plan"
  location            = azurerm_resource_group.Pandora_Box.location
  resource_group_name = azurerm_resource_group.Pandora_Box.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "Pandora_Webapp" {
  name                = "pandora-webapp"
  location            = azurerm_resource_group.Pandora_Box.location
  resource_group_name = azurerm_resource_group.Pandora_Box.name
  app_service_plan_id = azurerm_app_service_plan.Pandora_App_Service_Plan.id
}