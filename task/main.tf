terraform {
backend "azurerm" {
  }
}
provider "azurerm" {
  features {}
}

module "network" {
  source              = "./modules/network"
  resource_group_name = module.security.resource_group_name
  location            = var.location
  environment         = var.environment
}

module "security" {
  source              = "./modules/security"
  resource_group_name = var.resource_group_name
  location            = var.location
  nsg_rules           = var.nsg_rules
  environment         = var.environment
    public_subnets = {
    public = module.network.public_subnet  
  }

}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = var.resource_group_name
  location            = var.location
  environment         = var.environment
  vnicpublicid       = "${module.network.public_nic}"
  vnicprivateid       = "${module.network.private_nic}"
}
