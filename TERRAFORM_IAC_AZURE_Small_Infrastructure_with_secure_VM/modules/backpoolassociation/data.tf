data "azurerm_network_interface" "nic_data" {
    for_each = var.vm2_backend_attach
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}
data "azurerm_lb_backend_address_pool" "backend_pool_data" {
    for_each = var.vm2_backend_attach
  name                = each.value.backend_pool_name
  loadbalancer_id     = data.azurerm_lb.lb_data[each.key].id
}
data "azurerm_lb" "lb_data" {
    for_each = var.vm2_backend_attach
  name                = each.value.loadbalancer_name
  resource_group_name = each.value.rg_name
}