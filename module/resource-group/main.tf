
resource "azurerm_resource_group" "webapp" {
  name     = "resourceGroup-${var.project}-${var.env}"
  location = var.location

  tags = {
    Name        = "resourceGroup-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}