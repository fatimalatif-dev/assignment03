variable "project" {
  description = "Project name "
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
  default     = "East US"
}
variable "rgGroup" {
  description = "Name of the Resource Group"
  type        = string
}
variable "publicSubnetId" {
  description = "Id of the Public subnet"
  type        = string
}
variable "userName" {
  description = "Instance User Name for authentication"
  type        = string
}
variable "passWord" {
  description = "Instance password for authentication"
  type        = string
  sensitive   = true
}
variable "webNsg" {
  description = "Id of the existing network security group"
  type        = string
}