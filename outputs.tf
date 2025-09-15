output "resource_group_name" {
  value = module.resource_group.rg_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "vm_public_ips" {
  value = module.vm.public_ips
}
