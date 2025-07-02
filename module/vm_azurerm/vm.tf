resource "azurerm_network_interface" "example" {
  name                = var.nic_name
  location            = var.nic_loc
  resource_group_name = var.nic_rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.nic_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vm_name
  resource_group_name = var.vm_rg_name
  location            = var.vm_location
  size                = "Standard_F2"
  admin_username      = "tusharvm"
  admin_password      = "Tushar@2021"  # Strong password, change as needed
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}