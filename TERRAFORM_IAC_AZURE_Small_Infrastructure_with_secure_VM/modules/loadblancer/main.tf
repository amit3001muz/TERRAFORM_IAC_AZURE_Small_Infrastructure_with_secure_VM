resource "azurerm_lb" "lb" {
    for_each = var.loadbalancer
  name                = each.value.lb_name
  location            = each.value.lb_location
  resource_group_name = each.value.rg_name
  sku                 = each.value.sku

 dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration
    content {
       name                     = frontend_ip_configuration.value.frontend_ipconfiname
  subnet_id                     = data.azurerm_subnet.data[each.key].id
  private_ip_address_allocation = frontend_ip_configuration.value.private_ip_address_allocation
     }
}
}
resource "azurerm_lb_backend_address_pool" "pool1" {
    for_each = var.loadbalancer
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.backend_address_pool_name
}

resource "azurerm_lb_probe" "probe" {
    for_each = var.loadbalancer
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.probe_name
  port            = each.value.probe_port
}


resource "azurerm_lb_rule" "lb_rule" {
    for_each = var.loadbalancer
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = each.value.lb_rule_name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool1[each.key].id]
  probe_id                       = azurerm_lb_probe.probe[each.key].id
}