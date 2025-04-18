output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "virtual_network_name" {
  value = module.virtual_network.virtual_network_name
}

output "subnet_name" {
  value = module.subnet.subnet_name
}

output "nsg_name" {
  value = module.nsg.nsg_name
}

output "nsg_rule_name" {
  value = module.nsg_rule.nsg_rule_name
}




output "backend_public_ip" {
  value = module.public_ip_backend.public_ip_address
}

output "frontend_public_ip" {
  value = module.public_ip_frontend.public_ip_address
}
