variable "vm2_backend_attach" {
  type = map(object({
    ip_configuration_name = string
    nic_name              = string
    loadbalancer_name     = string  
    backend_pool_name     = string
    rg_name               = string
  }))
  
}