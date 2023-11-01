
data "azurerm_key_vault" "example" {
  name                = "az-task-kv"
  resource_group_name = "keyvault-rg"
}

data "azurerm_key_vault_secret" "admin_password_secret" {
  name         = "admin-password-secret"
  key_vault_id = data.azurerm_key_vault.example.id
}

resource "azurerm_windows_virtual_machine" "virtual_machines" {
  count = var.publiccount + var.privatecount 

  name                = "${var.environment}-${count.index < var.publiccount ? "public" : "private"}vm${count.index+1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = var.admin_username
  admin_password = data.azurerm_key_vault_secret.admin_password_secret.value

  network_interface_ids = [
    count.index < var.publiccount ? var.vnicpublicid : var.vnicprivateid
  ]

  os_disk {
    name              = "${var.environment}-${count.index < var.publiccount ? "public" : "private"}-osdisk-${count.index+1}"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
