output "firewall_rule_name" {
  description = "اسم قاعدة الجدار الناري"
  value       = azurerm_mssql_firewall_rule.this.name
}
