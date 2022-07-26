location = "canadacentral"
environment = "dev"
application = "web"
vm_count = 2
vm_size = "Standard_B4ms"
vnet_address_space = ["10.99.0.0/16"]
snet1_address_prefix = ["10.99.1.0/24"]
snet2_address_prefix = ["10.99.2.0/24"]
tags = {
  Environment = "Dev"
  CostPool  = "Server"
  ITTower = "Server"
}
