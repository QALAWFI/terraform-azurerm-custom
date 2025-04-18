variable "server_name" {}

variable "database_name" {}

variable "admin_username" {}

variable "admin_password" {}

variable "location" {}

variable "resource_group_name" {}

variable "sku_name" {
  description = "SKU الخاص بقاعدة البيانات"
  type        = string
  default     = "Basic"
}
