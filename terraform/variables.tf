variable "location" {
  type    = string
  default = "eastus"
}

variable "environment" {
  type    = string
  default = "local"
}

variable "application" {
  type    = string
  default = "relo"
}

variable "vm_count" {
  type    = number
  default = 3
}

variable "vm_size" {
  type    = string
  default = null
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/8"]
}

variable "snet1_address_prefix" {
  type    = list(string)
  default = ["10.1.0.0/16"]
}

variable "snet2_address_prefix" {
  type    = list(string)
  default = ["10.2.0.0/16"]
}

variable "tags" {
  type        = map(string)
  description = "Default Tags"
  default = {
    Environment = "Lab"
    CostPool    = "Software"
    ITTower     = "Server"
  }
}
