# Create public IP
locals {
  common_tags = {
    project     = var.project
    Environment = var.env
  }
}

resource "azurerm_public_ip" "publicip" {
  name                = "publicIP-${var.project}-${var.env}"
  location            = var.location
  resource_group_name = var.rgGroup
  allocation_method   = "Static"

  tags = merge(local.common_tags, { Name = "publicIP-${var.project}-${var.env}" })
}

# Create network interface
resource "azurerm_network_interface" "networkInterface" {
  name                = "networkInterface-${var.project}-${var.env}"
  location            = var.location
  resource_group_name = var.rgGroup

  ip_configuration {
    name                          = "NicConfiguration"
    subnet_id                     = var.publicSubnetId
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }

  tags = merge(local.common_tags, { Name = "NIC-${var.project}-${var.env}" })
}

resource "azurerm_network_interface_security_group_association" "nsgAssoc" {
  network_interface_id      = azurerm_network_interface.networkInterface.id
  network_security_group_id = var.webNsg
}


resource "azurerm_linux_virtual_machine" "webInstance" {
  name                  = "webInstance-${var.project}-${var.env}"
  location              = var.location
  resource_group_name   = var.rgGroup
  network_interface_ids = [azurerm_network_interface.networkInterface.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "OsDisk-${var.project}-${var.env}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_username = var.userName
  admin_password = var.passWord
  disable_password_authentication = false

  tags = merge(local.common_tags, { Name = "webInstance-${var.project}-${var.env}" })

}