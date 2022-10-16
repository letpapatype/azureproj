terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.27.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "azprojresour"
    storage_account_name = "appserstate1016"
    container_name       = "appservice-cont"
    key                  = "app.terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "appservrg" {
  name     = "appservice-rgroup"
  location = "East US"
}

resource "azurerm_service_plan" "appservplan" {
  name                = "appservice-plan"
  resource_group_name = azurerm_resource_group.appservrg.name
  location            = azurerm_resource_group.appservrg.location
  os_type             = "Windows"
  sku_name            = "B1"
}

resource "azurerm_windows_web_app" "appservapp" {
  name                = "jovanstesting"
  resource_group_name = azurerm_resource_group.appservrg.name
  location            = azurerm_resource_group.appservrg.location
  service_plan_id     = azurerm_service_plan.appservplan.id
  https_only          = true

  site_config {}
}