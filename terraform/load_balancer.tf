resource "azurerm_public_ip" "lb" {
  name                = "pip-${var.application}-${var.environment}-001"
  location            = azurerm_resource_group.rg_networking.location
  resource_group_name = azurerm_resource_group.rg_networking.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = "lb-${var.application}-${var.environment}-001"
  location            = azurerm_resource_group.rg_networking.location
  resource_group_name = azurerm_resource_group.rg_networking.name

  frontend_ip_configuration {
    name                 = "frontend_ip"
    public_ip_address_id = azurerm_public_ip.lb.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "pool001" {
  name            = "BackendPool001"
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "lb_http" {
  resource_group_name = azurerm_resource_group.rg_networking.name
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "http"
  port                = 80
  protocol            = "Http"
  request_path        = "/"
}

resource "azurerm_lb_rule" "lb" {
  resource_group_name            = azurerm_resource_group.rg_networking.name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "http"
  protocol                       = "Tcp"
  frontend_port                  = "80"
  backend_port                   = "80"
  frontend_ip_configuration_name = "frontend_ip"
  probe_id                       = azurerm_lb_probe.lb_http.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool001.id]
}
