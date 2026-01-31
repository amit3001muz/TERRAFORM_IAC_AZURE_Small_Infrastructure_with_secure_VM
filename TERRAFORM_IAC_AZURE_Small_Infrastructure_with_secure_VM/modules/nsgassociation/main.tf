resource "azurerm_subnet_network_security_group_association" "nsg_association" {
    for_each = var.nsg_association
  subnet_id                 = data.azurerm_subnet.data[each.key].id
  network_security_group_id = data.azurerm_network_security_group.datansg[each.key].id
}