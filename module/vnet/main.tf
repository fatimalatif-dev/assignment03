# Create public IP
locals {
  common_tags = {
    project     = var.project
    Environment = var.env
  }
}


resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.project}-${var.env}"
  location            = var.location
  resource_group_name = var.rgGroup

  # Address space for the entire VNet
  address_space = var.cidrRange

  # Optional DNS servers (defaults to Azure-provided DNS)
  dns_servers = []

  tags = merge (local.common_tags, {Name = "vnet-${var.project}-${var.env}"}) 

}

# Create subnets
resource "azurerm_subnet" "publicSubnet" {
  name                 = "public-subnet-${var.project}-${var.env}"
  resource_group_name  = var.rgGroup
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.publicCidrRange
}
# private subnet
resource "azurerm_subnet" "privateSubnet" {
  name                 = "private-subnet-${var.project}-${var.env}"
  resource_group_name  = var.rgGroup
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.privateCidrRange
}


# Create public IP
resource "azurerm_public_ip" "staticIP" {
  name                = "ip-${var.project}-${var.env}"
  location            = var.location
  resource_group_name = var.rgGroup
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = [1]

  tags = merge (local.common_tags, {Name = "staticIP-${var.project}-${var.env}"}) 

}


#Nat Gateway
resource "azurerm_nat_gateway" "natGW" {
  name                    = "natGW-${var.project}-${var.env}"
  location                = var.location
  resource_group_name     = var.rgGroup
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = [1]
}

# Nat - Public IP Association
resource "azurerm_nat_gateway_public_ip_association" "ipAssociation" {
 nat_gateway_id       = azurerm_nat_gateway.natGW.id
 public_ip_address_id = azurerm_public_ip.staticIP.id
}

resource "azurerm_subnet_nat_gateway_association" "natgwasso" {
  subnet_id      = azurerm_subnet.privateSubnet.id
  nat_gateway_id = azurerm_nat_gateway.natGW.id
}
