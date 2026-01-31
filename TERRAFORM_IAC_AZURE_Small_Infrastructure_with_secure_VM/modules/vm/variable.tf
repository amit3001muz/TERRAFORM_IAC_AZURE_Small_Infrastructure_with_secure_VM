variable "nic" {
  type = map(object({
    nic_name                          = string
    rg_location                       = string
    rg_name                           = string
    subnet_name                       = string
    vnet_name                         = string
     ip_configuration                   = map(object({
      ip_config_name = string
      private_ip_address_allocation = string
    }))

    vm_name                           = string
    vm_size                           = string
    
    source_image_reference           = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
    os_disk                   = map(object({
      caching           = string
        managed_disk_type = string
    }))
   
  }))
}