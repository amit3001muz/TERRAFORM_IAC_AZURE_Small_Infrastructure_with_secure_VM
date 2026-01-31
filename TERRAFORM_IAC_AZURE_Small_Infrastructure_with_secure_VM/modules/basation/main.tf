resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastion
  name                = each.value.bastion_name
  location            = each.value.bastion_location
  resource_group_name = each.value.rg_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations
    content {
      name                 = ip_configuration.value.ip_config_name
      subnet_id            = data.azurerm_subnet.data[each.key].id
      public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
    }
  }
}