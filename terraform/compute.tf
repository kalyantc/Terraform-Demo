resource "azurerm_availability_set" "availset" {
  name                = "avail-${var.application}-${var.environment}-001"
  location            = azurerm_resource_group.rg_compute.location
  resource_group_name = azurerm_resource_group.rg_compute.name

  tags = var.tags
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "nic-vm-${count.index}"
  location            = azurerm_resource_group.rg_compute.location
  resource_group_name = azurerm_resource_group.rg_compute.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.snet-001.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_network_interface_backend_address_pool_association" "pool_association" {
  count                   = var.vm_count
  network_interface_id    = element(azurerm_network_interface.nic.*.id, count.index)
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool001.id
  ip_configuration_name   = "ipconfig"
}

resource "azurerm_linux_virtual_machine" "vm" {
  count = var.vm_count # Number of VM instances.

  name                = "vm-${count.index}"                        # Name of the VM.
  location            = azurerm_resource_group.rg_compute.location # Location of the VM.
  resource_group_name = azurerm_resource_group.rg_compute.name     # Resrouce group name of the VM.

  admin_username = "azureuser"                                 # VM username.
  admin_password = "Password1234"                              # VM password.
  custom_data    = filebase64("${path.root}/scripts/setup.sh") # Bootstrap script.

  disable_password_authentication = false
  network_interface_ids = [
    element(azurerm_network_interface.nic.*.id, count.index)
  ]
  availability_set_id = azurerm_availability_set.availset.id
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  size = var.vm_size       # VM size.
  source_image_reference { # VM OS details.
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }



  tags = var.tags
}