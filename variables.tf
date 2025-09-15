variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "rg_location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "admin_username" {
  description = "Admin username for VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for VM"
  type        = string
  sensitive   = true
}
