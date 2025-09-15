resource "azurerm_network_interface" "nic" {
  count               = length(var.subnet_ids)
  name                = "nic-${count.index}"
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id                     = var.subnet_ids[count.index]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm[count.index].id
  }
}

resource "azurerm_public_ip" "vm" {
  count               = length(var.subnet_ids)
  name                = "publicip-${count.index}"
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
}

resource "azurerm_linux_virtual_machine" "vm" {
  count               = length(var.subnet_ids)
  name                = "vm-${count.index}"
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = "Standard_B1s"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  os_disk {
    name              = "osdisk-${count.index}"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

output "public_ips" {
  value = azurerm_public_ip.vm[*].ip_address
}
