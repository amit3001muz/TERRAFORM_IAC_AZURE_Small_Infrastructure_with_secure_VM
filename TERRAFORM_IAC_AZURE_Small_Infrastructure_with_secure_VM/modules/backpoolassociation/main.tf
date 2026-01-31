resource "azurerm_network_interface_backend_address_pool_association" "vm2_backend_attach" {
  for_each = var.vm2_backend_attach
  network_interface_id    = data.azurerm_network_interface.nic_data[each.key].id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.backend_pool_data[each.key].id
}
