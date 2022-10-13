data "azurerm_resource_group" "rg"{
  name                = var.resource_group_name
}

resource "azure_app_service_plan" "appln"{
  name                = var.service_plan
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azure_app_service" "webapp" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
}
