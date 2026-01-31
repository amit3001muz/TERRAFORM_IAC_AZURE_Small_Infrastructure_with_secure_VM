resource "azurerm_network_interface" "nic" {
    for_each = var.nic
  name                = each.value.nic_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
dynamic "ip_configuration" {
  
    for_each = each.value.ip_configuration
    content {
      name                          = ip_configuration.value.ip_config_name
      subnet_id                     = data.azurerm_subnet.data[each.key].id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
}
}
resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.nic
  name                  = each.value.vm_name
  location              = each.value.rg_location
  resource_group_name   = each.value.rg_name    
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
 size               = each.value.vm_size
    admin_username = "rajuuser"
    admin_password = "Raju@singh09"
    disable_password_authentication = false
 dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }
dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      caching           = os_disk.value.caching
        storage_account_type = os_disk.value.managed_disk_type
    }
  }
}
