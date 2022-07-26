resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.application}-${var.environment}-001"
  location            = azurerm_resource_group.rg_networking.location
  resource_group_name = azurerm_resource_group.rg_networking.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "snet-001" {
  name                 = "snet-${var.application}-${var.environment}-001"
  resource_group_name  = azurerm_resource_group.rg_networking.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.snet1_address_prefix
}

resource "azurerm_subnet" "snet-002" {
  name                 = "snet-${var.application}-${var.environment}-002"
  resource_group_name  = azurerm_resource_group.rg_networking.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.snet2_address_prefix
}