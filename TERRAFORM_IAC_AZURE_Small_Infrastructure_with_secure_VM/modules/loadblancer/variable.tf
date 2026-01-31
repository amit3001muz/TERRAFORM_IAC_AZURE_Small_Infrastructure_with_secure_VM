variable "loadbalancer" {
    type = map(object({
      lb_name = string
      lb_location = string
      rg_name = string
      sku = string
      subnet_name = string
      vnet_name = string
      backend_address_pool_name = string
        probe_name = string
        probe_port = number
        lb_rule_name = string
        protocol = string
        frontend_port = number
        backend_port = number
        frontend_ip_configuration_name = string
      frontend_ip_configuration = map(object({
        frontend_ipconfiname = string
        private_ip_address_allocation = string
      }))
    }))
}