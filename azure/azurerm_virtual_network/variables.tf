variable "name" {
  description = "اسم الـ Virtual Network"
  type        = string
}

variable "address_space" {
  description = "نطاق العناوين (CIDR)"
  type        = list(string)
}

variable "location" {
  description = "موقع الـ VNet"
  type        = string
}

variable "resource_group_name" {
  description = "اسم الـ Resource Group اللي بينشئ فيه الـ VNet"
  type        = string
}
