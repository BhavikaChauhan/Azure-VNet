# ----------------------------
# Virtual Network
# ----------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.rg_location
  resource_group_name = var.rg_name
}

# ----------------------------
# Subnets
# ----------------------------
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnets)
  name                 = var.subnets[count.index].name
  address_prefixes     = [var.subnets[count.index].address_prefix]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.rg_name
}

# ----------------------------
# Network Security Group
# ----------------------------
resource "azurerm_network_security_group" "subnet_nsg" {
  name                = "${var.vnet_name}-nsg"
  location            = var.rg_location
  resource_group_name = var.rg_name

  # Allow SSH
  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Allow internal VNet communication
  security_rule {
    name                       = "Allow-VNet-Internal"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }
}

 # Allow all outbound traffic (internet + ping)
  security_rule {
    name                       = "Allow-All-Outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# ----------------------------
# Associate NSG with each subnet
# ----------------------------
resource "azurerm_subnet_network_security_group_association" "subnet_assoc" {
  count                     = length(azurerm_subnet.subnets)
  subnet_id                 = azurerm_subnet.subnets[count.index].id
  network_security_group_id = azurerm_network_security_group.subnet_nsg.id
}

# ----------------------------
# Outputs
# ----------------------------
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  value = azurerm_subnet.subnets[*].id
}
