terraform {
  backend "azurerm" {
    resource_group_name  = "kml_rg_main-7f95962493ea46f6"
    storage_account_name = "backendtfapp"
    container_name       = "backendfile"
    key                  = "terraform.tfstate"
  }
}