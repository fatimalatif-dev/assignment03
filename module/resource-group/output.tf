output "resourceGroup" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.webapp.name

}
output "rgLocation" {
  description = "Loaction/region of the resource group"
  value       = azurerm_resource_group.webapp.location
}

