resource "azurerm_storage_account" "webStorage" {
  name                     = "webstorage${var.project}${var.env}"
  resource_group_name      = var.rgGroup
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Name        = "webstorage-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

resource "azurerm_storage_container" "webContianer" {
  name                  = "webcontainer-${var.project}-${var.env}"
  storage_account_id    = azurerm_storage_account.webStorage.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "webBlob" {
  name                   = "webblob-${var.project}-${var.env}"
  storage_account_name   = azurerm_storage_account.webStorage.name
  storage_container_name = azurerm_storage_container.webContianer.name
  type                   = "Block"
}