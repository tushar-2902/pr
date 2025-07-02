resource "azurerm_mssql_database" "example" {
  name           = var.name
  server_id      = "/subscriptions/cebec115-76a4-41a3-b52f-1485335c2232/resourceGroups/tushar_rg/providers/Microsoft.Sql/servers/tusharsql"
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 5  
  read_scale     = false  
  sku_name       = "S0"
  zone_redundant = false 
  # enclave_type   = "VBS"  # REMOVE this line, not supported in S0
}
