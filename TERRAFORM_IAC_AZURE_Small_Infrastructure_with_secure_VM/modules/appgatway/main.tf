resource "azurerm_application_gateway" "appgateway" {
    for_each = var.appgateway
  name                = each.value.appgateway_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location

  dynamic "sku" {
    for_each = each.value.sku
    content {
    name     = sku.value.sku_name
    tier     = sku.value.sku_tier
    capacity = sku.value.sku_capacity
      }
 }

  dynamic "gateway_ip_configuration" {
    for_each = each.value.gateway_ip_configuration
    content {
      name      = gateway_ip_configuration.value.gateway_ipname
      subnet_id = data.azurerm_subnet.data[each.key].id
    }
  }

  dynamic "frontend_port" {
    for_each = each.value.frontend_port
    content {
      name = frontend_port.value.name
      port = frontend_port.value.port
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration
    content {
      name                 = frontend_ip_configuration.value.frontend_ipconfiname
      public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
    }
  }

  dynamic "backend_address_pool" {
    for_each = each.value.backend_address_pool
    content {
      name = backend_address_pool.value.aapgatway_backendpool_name
    }
  }

  dynamic "backend_http_settings" {
    for_each = each.value.backend_http_settings
    content {
      name                  = backend_http_settings.value.http_name
      cookie_based_affinity = backend_http_settings.value.cookie_based_affinity
      path                  = "/path1/"
      port                  = 80
      protocol              = "Http"
      request_timeout       = 60
    }
  }

  dynamic "http_listener" {
    for_each = each.value.http_listener
    content {
      name                           = http_listener.value.listener_name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = "Http"
    }
  }

  dynamic "request_routing_rule" {
    for_each = each.value.request_routing_rule
    content {
      name                       = request_routing_rule.value.routing_name
      priority                   = 9
      rule_type                  = "Basic"
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_address_pool_name
    backend_http_settings_name = request_routing_rule.value.backend_http_settings_name
    }
  }
}