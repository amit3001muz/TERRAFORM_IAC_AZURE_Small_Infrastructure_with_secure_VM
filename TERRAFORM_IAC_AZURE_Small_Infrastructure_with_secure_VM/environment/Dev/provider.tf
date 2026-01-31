#here we are taken terraform version as well fixes required provider version.
terraform {
  required_version = ">= 1.11.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

#thia is provider block which communicates with resources.
provider "azurerm" {
  features {}
  subscription_id = "eac9ee72-3e50-4c23-b8c3-081a1f02b52a"
}