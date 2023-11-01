resource "azurerm_virtual_network" "example" {
  name                = "${var.environment}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "public" {
  name                 = "${var.environment}-public"
  resource_group_name  =  var.resource_group_name
 virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_subnet" "private" {
  name                 = "${var.environment}-private"
  resource_group_name  =  var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "example" {
  name                = "${var.environment}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "public" {
  name                = "${var.environment}-public-nic"
  location            = "${var.location}"
  resource_group_name =  "${var.resource_group_name}"
  ip_configuration {
    name                          = "${var.environment}-public-ip-config"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id           = azurerm_public_ip.example.id
  }
}
resource "azurerm_network_interface" "private" {
  name                = "${var.environment}-private-nic"
  location            = "${var.location}"
  resource_group_name =  "${var.resource_group_name}"
  ip_configuration {
    name                          = "${var.environment}-private-ip-config"
    subnet_id                     = azurerm_subnet.private.id
    private_ip_address_allocation = "Dynamic"
  }
}
