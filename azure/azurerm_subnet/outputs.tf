output "subnet_name" {
  description = "اسم الـ Subnet"
  value       = azurerm_subnet.this.name
}

output "subnet_id" {
  description = "ID الخاص بالـ Subnet"
  value       = azurerm_subnet.this.id
}
