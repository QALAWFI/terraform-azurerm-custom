output "sql_server_name" {
  description = "اسم سيرفر SQL"
  value       = azurerm_mssql_server.this.name
}

output "sql_database_name" {
  description = "اسم قاعدة البيانات"
  value       = azurerm_mssql_database.this.name
}

output "sql_server_id" {
  description = "ID الخاص بسيرفر SQL"
  value       = azurerm_mssql_server.this.id
}
