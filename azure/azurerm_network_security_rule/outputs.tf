output "nsg_rule_name" {
  description = "اسم الـ NSG Rule"
  value       = azurerm_network_security_rule.this.name
}
