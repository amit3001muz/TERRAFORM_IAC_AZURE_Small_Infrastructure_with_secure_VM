resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "nic_aapgatway" {
    for_each = var.nic_aapgatway
  ip_configuration_name   = each.value.ip_configuration_name
  network_interface_id    = data.azurerm_network_interface.nic_data[each.key].id
  backend_address_pool_id = data.azurerm_application_gateway_backend_address_pool.aapgatway_data[each.key].id
}

