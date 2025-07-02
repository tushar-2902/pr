resource "azurerm_subnet" "subnet1" {
  name                 = var.name
  resource_group_name  = var.rg_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}

