output "vnetId" {
    description = "Id of the Virtual network"
    value = azurerm_virtual_network.vnet.id
}
output "publicSubnetId" {
    description = "Public subnet Id"
    value = azurerm_subnet.publicSubnet.id
}
output "privateSubnetId" {
    description = "private subnet Id"
    value = azurerm_subnet.privateSubnet.id
}