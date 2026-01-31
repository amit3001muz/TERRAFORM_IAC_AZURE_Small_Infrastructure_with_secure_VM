variable "nsg" {
  type = map(object({
    nsg_name            = string
    nsg_location        = string
    rg_name             = string
    security_rules      = map(object({
      name                          = string
      priority                      = number
      direction                     = string
      access                        = string
      protocol                      = string
      destination_port_range        = string
    }))
  }))
}