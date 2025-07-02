module "resource" {
  source = "../module/resource_azurerm"
  rg_name = "tushar_rg"
  location = "west US 3"
}

module "virtual_network" {
  depends_on = [module.resource]
  source = "../module/vn_azurerm"
  name = "tushar_vn"
  location = "west us 3"
  rg_name = "tushar_rg"
}

module "frontend_subnet" {
  depends_on = [ module.virtual_network ]
  source = "../module/subnet_azurerm"
  name = "frontend_subnet"
  rg_name = "tushar_rg"
  virtual_network_name = "tushar_vn"
  address_prefixes = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on = [ module.virtual_network ]
  source = "../module/subnet_azurerm"
  name = "backend_subnet"
  rg_name = "tushar_rg"
  virtual_network_name = "tushar_vn"
  address_prefixes = ["10.0.2.0/24"]
}

module "frontend_vm" {
  depends_on = [ module.frontend_subnet ]
  source = "../module/vm_azurerm"
  nic_name = "tusharnic"
  nic_loc = "west us 3"
  nic_rg_name = "tushar_rg"
  nic_subnet_id = "/subscriptions/cebec115-76a4-41a3-b52f-1485335c2232/resourceGroups/tushar_rg/providers/Microsoft.Network/virtualNetworks/tushar_vn/subnets/frontend_subnet"
  vm_name = "frontendvm"
  vm_rg_name = "tushar_rg"
  vm_location = "west us 3"

}

module "backend_vm" {
  depends_on = [ module.backend_subnet ]
  source = "../module/vm_azurerm"
  nic_name = "tusharnic1"
  nic_loc = "west us 3"
  nic_rg_name = "tushar_rg"
  nic_subnet_id = "/subscriptions/cebec115-76a4-41a3-b52f-1485335c2232/resourceGroups/tushar_rg/providers/Microsoft.Network/virtualNetworks/tushar_vn/subnets/backend_subnet"
  vm_name = "backendvm-tm"
  vm_rg_name = "tushar_rg"
  vm_location = "west us 3"

}

module "sql_name" {
  source = "../module/sqlserver_azurerm"
  sql_name = "tusharsql"
  rg_name = "tushar_rg"
  rg_location = "west us 3"
}

module "db"{
  depends_on = [ module.sql_name ]
  source = "../module/sqldatbase_azurerm"
  name = "tushar-db"
}