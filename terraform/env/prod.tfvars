location = "canadacentral"
environment = "prod"
application = "web"
vm_count = 2
vm_size = "Standard_D4s_v4"
vnet_address_space = ["10.1.0.0/16"]
snet1_address_prefix = ["10.1.1.0/24"]
snet2_address_prefix = ["10.1.2.0/24"]
tags = {
  Environment = "Prod"
  CostPool  = "Server"
  ITTower = "Server"
}
