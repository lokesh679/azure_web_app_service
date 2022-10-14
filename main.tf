terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.07.0"
    }
  }
}

provider "azurerm" {
  features {}
}


data "azurerm_resource_group" "rg"{
  name                = var.resource_group_name
}



resource "azurerm_app_service_plan" "appln"{
  name                = var.service_plan
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  app_service_plan_id = azurerm_app_service_plan.appln.id
}
