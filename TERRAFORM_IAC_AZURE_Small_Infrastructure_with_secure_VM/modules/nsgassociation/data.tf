data "azurerm_network_security_group" "datansg" {
    for_each = var.nsg_association
  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
}
data "azurerm_subnet" "data" {
    for_each = var.nsg_association
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}