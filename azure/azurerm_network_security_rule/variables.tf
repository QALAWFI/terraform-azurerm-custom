variable "name" {
  description = "اسم الـ Rule"
  type        = string
}

variable "priority" {
  description = "الأولوية"
  type        = number
}

variable "direction" {
  description = "الوجهة (Inbound أو Outbound)"
  type        = string
}

variable "access" {
  description = "السماح أو المنع (Allow أو Deny)"
  type        = string
}

variable "protocol" {
  description = "البروتوكول (TCP أو UDP أو *)"
  type        = string
}

variable "destination_port_range" {
  description = "البورت المراد فتحه"
  type        = string
}

variable "resource_group_name" {
  description = "اسم الـ Resource Group"
  type        = string
}

variable "network_security_group_name" {
  description = "اسم الـ Network Security Group"
  type        = string
}
