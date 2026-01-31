#This is resource group which contains all resources, it works like a shopping bag inside super market.
resource "azurerm_resource_group" "rg" {
    for_each = var.rg
    name = each.value.rg_name
    location = each.value.rg_location
}