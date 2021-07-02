provider "azurerm" {
  features {}
}

# Terraform config
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46.0"
    }
  }
  required_version = "~> 0.15"
}