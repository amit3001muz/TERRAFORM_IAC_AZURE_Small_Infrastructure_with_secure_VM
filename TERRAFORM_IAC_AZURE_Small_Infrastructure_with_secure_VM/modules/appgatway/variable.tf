variable "appgateway" {
  type = map(object({
    appgateway_name                = string
    rg_name                        = string
    rg_location                    = string
    vnet_name                      = string
    subnet_name                    = string
    public_ip_name                 = string
    sku                            = map(object({
      sku_name     = string
      sku_tier     = string
      sku_capacity = number
    }))
    gateway_ip_configuration       = map(object({
      gateway_ipname = string
    }))
    frontend_port                  = map(object({
      name = string
      port = number
    }))
    frontend_ip_configuration      = map(object({
      frontend_ipconfiname   = string
    }))
    backend_address_pool           = map(object({
      aapgatway_backendpool_name  = string
    }))
    backend_http_settings          = map(object({
      http_name                  = string
      cookie_based_affinity      = string
    }))
    http_listener                  = map(object({
      listener_name                           = string
      frontend_ip_configuration_name          = string
      frontend_port_name                      = string
    }))
    request_routing_rule           = map(object({
      routing_name                            = string
      http_listener_name                      = string
      backend_address_pool_name               = string
      backend_http_settings_name              = string

    }))

  }))

}