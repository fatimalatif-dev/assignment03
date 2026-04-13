locals {
  project = "azure"
  env     = terraform.workspace
}

module "resourceGroup" {
  source  = "./module/resource-group"
  project = local.project
  env     = local.env
}

module "vnet" {
  source           = "./module/vnet"
  project          = local.project
  env              = local.env
  location         = module.resourceGroup.rgLocation
  rgGroup          = module.resourceGroup.resourceGroup
  cidrRange        = ["10.0.0.0/16"]
  publicCidrRange  = ["10.0.1.0/24"]
  privateCidrRange = ["10.0.10.0/24"]
}

module "webSecurityGroup" {
  source   = "./module/securityGroup"
  project  = local.project
  env      = local.env
  location = module.resourceGroup.rgLocation
  rgGroup  = module.resourceGroup.resourceGroup

}

module "virtualMachine" {
  source   = "./module/vm"
  project  = local.project
  env      = local.env
  location = module.resourceGroup.rgLocation
  rgGroup        = module.resourceGroup.resourceGroup
  userName       = "useradmin"
  passWord       = "8weR@888888"
  publicSubnetId = module.vnet.publicSubnetId
  webNsg         = module.webSecurityGroup.webSgId
}

module "webBlobStorage" {
  source   = "./module/blobStorage"
  project  = local.project
  env      = local.env
  location = module.resourceGroup.rgLocation
  rgGroup  = module.resourceGroup.resourceGroup
}