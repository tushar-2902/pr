resource "azurerm_mssql_server" "example" {
  name                         = var.sql_name
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = "12.0"
  administrator_login          = "tusharsql"
  administrator_login_password = "Tushar@2021"

}

