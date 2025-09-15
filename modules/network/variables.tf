variable "rg_name" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "vnet_name" {
  type = string
}
variable "address_space" {
  type = list(string)
}
variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}
