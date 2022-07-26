terraform {
  required_version = ">= 0.12.0"
  backend "azurerm" {
    resource_group_name  = "rg-omes-demo-canadacentral-001"
    storage_account_name = "stomestfdemoccl001"
    container_name       = "terraform"
    # key                  = "dev.terraform.tfstate"
    # key                  = "prod.terraform.tfstate"
  }
}