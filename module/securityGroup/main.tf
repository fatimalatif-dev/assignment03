# Create the NSG
resource "azurerm_network_security_group" "webSg" {
  name                = "webNsg-${var.project}-${var.env}"
  location            = var.location
  resource_group_name = var.rgGroup
  tags = {
    Name        = "webSg-${var.project}-${var.env}"
    project     = var.project
    Environment = var.env
  }
}

# Add inbound rules
resource "azurerm_network_security_rule" "inbound_rules" {
  for_each = { for rule in var.inboundRules : rule.name => rule }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  network_security_group_name = azurerm_network_security_group.webSg.name
  resource_group_name         = var.rgGroup
}

# Add outbound rules
resource "azurerm_network_security_rule" "outbound_rules" {
  for_each = { for rule in var.outboundRules : rule.name => rule }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  network_security_group_name = azurerm_network_security_group.webSg.name
  resource_group_name         = var.rgGroup
}