variable "project" {
  description = "Project name"
  type        = string
  default     = "azure"
}
variable "env" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
variable "location" {
  description = "Loctaion of the resource group"
  type        = string
}
variable "rgGroup" {
  description = "Name of the Resource Group"
  type        = string
}

variable "inboundRules" {
  description = "List of inbound security rules"
  type = list(object({
    name                       = string
    priority                   = number
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    access                     = string
    direction                  = string
  }))
  default = [
    {
      name                       = "Allow-SSH"
      priority                   = 1001
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      direction                  = "Inbound"
    },
    {
      name                       = "Allow-HTTP"
      priority                   = 1002
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      direction                  = "Inbound"
    },
    {
      name                       = "Allow-HTTPS"
      priority                   = 1003
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      direction                  = "Inbound"
    }
  ]
}

variable "outboundRules" {
  description = "List of outbound security rules"
  type = list(object({
    name                       = string
    priority                   = number
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    access                     = string
    direction                  = string
  }))
  default = [
    {
      name                       = "Allow-Internet-Outbound"
      priority                   = 100
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      direction                  = "Outbound"
    }
  ]
}