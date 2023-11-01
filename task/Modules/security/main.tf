resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_network_security_group" "example" {
  name                = "${var.environment}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

 dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      direction                  = security_rule.value["direction"]
      access                     = security_rule.value["access"]
      protocol                   = security_rule.value["protocol"]
      source_port_range          = security_rule.value["source_port_range"]
      destination_port_range     = security_rule.value["destination_port_range"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
    }
  } 

}

resource "azurerm_subnet_network_security_group_association" "public" {
  for_each              = var.public_subnets
  subnet_id             = var.public_subnets[each.key].id
  network_security_group_id = azurerm_network_security_group.example.id
}
