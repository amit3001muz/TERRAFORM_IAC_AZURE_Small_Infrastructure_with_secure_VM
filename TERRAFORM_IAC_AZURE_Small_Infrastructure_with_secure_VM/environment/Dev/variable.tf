variable "rg" {
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
}
variable "vnet" {
  type = map(object({
    vnet_name     = string
    rg_name       = string
    rg_location   = string
    address_space = list(string)
    subnet = map(object({
      subnet_name      = string
      address_prefixes = list(string)
    }))
  }))
}
variable "pip" {
  type = map(object({
    pip_name          = string
    rg_name           = string
    rg_location       = string
    allocation_method = string
    sku               = string
  }))

}
variable "nic" {
  type = map(object({
    nic_name    = string
    rg_location = string
    rg_name     = string
    subnet_name = string
    vnet_name   = string
    ip_configuration = map(object({
      ip_config_name                = string
      private_ip_address_allocation = string
    }))

    vm_name = string
    vm_size = string

    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
    os_disk = map(object({
      caching           = string
      managed_disk_type = string
    }))

  }))
}
variable "bastion" {
  type = map(object({
    bastion_name     = string
    bastion_location = string
    rg_name          = string
    vnet_name        = string
    subnet_name      = string
    public_ip_name   = string
    ip_configurations = map(object({
      ip_config_name = string
    }))
  }))
}
variable "nsg" {
  type = map(object({
    nsg_name     = string
    nsg_location = string
    rg_name      = string
    security_rules = map(object({
      name                   = string
      priority               = number
      direction              = string
      access                 = string
      protocol               = string
      destination_port_range = string
    }))
  }))
}
variable "nsg_association" {
  type = map(object({
    subnet_name = string
    vnet_name   = string
    nsg_name    = string
    rg_name     = string
  }))
}
variable "loadbalancer" {
  type = map(object({
    lb_name                        = string
    lb_location                    = string
    rg_name                        = string
    sku                            = string
    subnet_name                    = string
    vnet_name                      = string
    backend_address_pool_name      = string
    probe_name                     = string
    probe_port                     = number
    lb_rule_name                   = string
    protocol                       = string
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string
    frontend_ip_configuration = map(object({
      frontend_ipconfiname          = string
      private_ip_address_allocation = string
    }))
  }))
}
variable "vm2_backend_attach" {
  type = map(object({
    ip_configuration_name = string
    nic_name              = string
    loadbalancer_name     = string
    backend_pool_name     = string
    rg_name               = string
  }))

}
variable "appgateway" {
  type = map(object({
    appgateway_name = string
    rg_name         = string
    rg_location     = string
    vnet_name       = string
    subnet_name     = string
    public_ip_name  = string
    sku = map(object({
      sku_name     = string
      sku_tier     = string
      sku_capacity = number
    }))
    gateway_ip_configuration = map(object({
      gateway_ipname = string
    }))
    frontend_port = map(object({
      name = string
      port = number
    }))
    frontend_ip_configuration = map(object({
      frontend_ipconfiname = string
    }))
    backend_address_pool = map(object({
      aapgatway_backendpool_name = string
    }))
    backend_http_settings = map(object({
      http_name             = string
      cookie_based_affinity = string
    }))
    http_listener = map(object({
      listener_name                  = string
      frontend_ip_configuration_name = string
      frontend_port_name             = string
    }))
    request_routing_rule = map(object({
      routing_name               = string
      http_listener_name         = string
      backend_address_pool_name  = string
      backend_http_settings_name = string

    }))

  }))

}
variable "nic_aapgatway" {
  type = map(object({
    ip_configuration_name      = string
    nic_name                   = string
    rg_name                    = string
    aapgatway_backendpool_name = string
    appgateway_name            = string
  }))
}