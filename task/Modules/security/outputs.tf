output "nsg_id" {
  description = "ID of the network security group (NSG) created in the security module."
  value       = azurerm_network_security_group.example.id
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}