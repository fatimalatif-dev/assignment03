# Output the NSG ID
output "webSgId" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.webSg.id
}

# Output the NSG Name
output "webSgName" {
  description = "The name of the Network Security Group"
  value       = azurerm_network_security_group.webSg.name
}

