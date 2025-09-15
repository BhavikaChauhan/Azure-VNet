rg_name      = "demo-rg"
rg_location  = "eastus"

vnet_name    = "demo-vnet"
address_space = ["10.0.0.0/16"]

subnets = [
  {
    name           = "working-subnet"
    address_prefix = "10.0.1.0/24"
  },
  {
    name           = "auth-subnet"
    address_prefix = "10.0.2.0/24"
  },
  {
    name           = "web-subnet"
    address_prefix = "10.0.3.0/24"
  }
]

admin_username = "azureuser"
admin_password = "YourP@ssword123!"
