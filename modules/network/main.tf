resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "subnets" {
  count                = length(var.subnets)
  name                 = var.subnets[count.index].name
  address_prefixes     = [var.subnets[count.index].address_prefix]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.rg_name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  value = azurerm_subnet.subnets[*].id
}
