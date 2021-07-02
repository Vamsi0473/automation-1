terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateRG"
    storage_account_name = "tfstatelab9314"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}