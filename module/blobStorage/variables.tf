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
  description = "Loctaion of the resource group "
  type        = string
}
variable "rgGroup" {
  description = "Resource group name"
  type        = string

}