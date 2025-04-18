variable "name" {
  description = "اسم الـ Firewall Rule"
  type        = string
}

variable "server_id" {
  description = "ID الخاص بسيرفر Azure SQL"
  type        = string
}

variable "start_ip_address" {
  description = "بداية الـ IP range المسموح"
  type        = string
}

variable "end_ip_address" {
  description = "نهاية الـ IP range المسموح"
  type        = string
}
