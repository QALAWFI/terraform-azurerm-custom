output "resource_group_name" {
  description = "اسم الـ Resource Group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_location" {
  description = "موقع الـ Resource Group"
  value       = azurerm_resource_group.this.location
}
