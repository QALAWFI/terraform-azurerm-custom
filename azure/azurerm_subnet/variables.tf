variable "name" {
  description = "اسم الـ Subnet"
  type        = string
}

variable "resource_group_name" {
  description = "اسم الـ Resource Group"
  type        = string
}

variable "virtual_network_name" {
  description = "اسم الـ Virtual Network"
  type        = string
}

variable "address_prefixes" {
  description = "CIDR blocks للـ Subnet"
  type        = list(string)
}
