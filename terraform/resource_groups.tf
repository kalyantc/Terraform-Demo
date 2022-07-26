resource "azurerm_resource_group" "rg_networking" {
  name     = "rg-${var.application}-${var.environment}-networking-001"
  location = var.location
}

resource "azurerm_resource_group" "rg_compute" {
  name     = "rg-${var.application}-${var.environment}-compute-001"
  location = var.location
}