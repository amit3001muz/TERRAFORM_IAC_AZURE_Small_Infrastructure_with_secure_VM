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