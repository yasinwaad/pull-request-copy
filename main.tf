terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "resources"
  location = "uksouth"
}

# resource "azurerm_resource_group" "example" {
#   name     = "prod-resources"
#   location = "uksouth"
# }

# # Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {

  name                = "kloudskool"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

# # Create a virtual network within the resource group
# resource "azurerm_virtual_network" "example" {

#   name                = "kloudskool"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location
#   address_space       = ["10.0.0.0/16"]
# }
oops