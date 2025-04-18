variable "name" {
  description = "اسم الـ Network Interface"
  type        = string
}

variable "location" {
  description = "موقع الـ NIC"
  type        = string
}

variable "resource_group_name" {
  description = "اسم الـ Resource Group"
  type        = string
}

variable "subnet_id" {
  description = "ID الخاص بالـ Subnet"
  type        = string
}

variable "public_ip_id" {
  description = "ID الخاص بالـ Public IP"
  type        = string
}

variable "nsg_id" {
  description = "ID الخاص بالـ NSG"
  type        = string
}
