output "webId" {
  description = "ID for the public Instance"
  value       = azurerm_linux_virtual_machine.webInstance.id

}
output "webPublicIP" {
  description = "Public Ip of the virtual machine"
  value       = azurerm_linux_virtual_machine.webInstance.public_ip_address
}

