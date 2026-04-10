variable "project" {
    description = "Project name "
    type = string
    default = "azure"
}
variable "env" {
    description = "Environment name"
    type = string
    default = "dev"
}
variable "location" {
    description = "Loctaion of the resource group"
    type = string
}
variable "cidrRange" {
  description = "Value of the address space"
  type = list(string)
  default = ["10.0.0.0/16"]
}
variable "rgGroup" {
    description = "Name of the Resource Group"
    type = string
}
variable "publicCidrRange" {
   description = "Cidr Range for the public Subnet"
   type = list(string)
}
variable "privateCidrRange" {
    description = "Cidr Range for the private Subnet"
    type = list(string)
  
}