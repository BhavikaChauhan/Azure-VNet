module "resource_group" {
  source = "./modules/resource_group"
  rg_name = var.rg_name
  rg_location = var.rg_location
}

module "network" {
  source       = "./modules/network"
  rg_name      = module.resource_group.rg_name
  rg_location  = module.resource_group.rg_location
  vnet_name    = var.vnet_name
  address_space = var.address_space
  subnets      = var.subnets
}

module "vm" {
  source       = "./modules/vm"
  rg_name      = module.resource_group.rg_name
  rg_location  = module.resource_group.rg_location
  subnet_ids   = module.network.subnet_ids
  admin_username = var.admin_username
  admin_password = var.admin_password
}
