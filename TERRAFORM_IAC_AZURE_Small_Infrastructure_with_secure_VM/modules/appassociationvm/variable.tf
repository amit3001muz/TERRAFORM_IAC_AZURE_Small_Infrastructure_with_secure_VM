variable "nic_aapgatway" {
  type = map(object({
    ip_configuration_name   = string
    nic_name                = string
    rg_name                 = string
    aapgatway_backendpool_name = string
    appgateway_name         = string
  }))
}