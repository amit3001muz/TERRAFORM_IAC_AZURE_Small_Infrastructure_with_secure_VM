variable "nsg_association" {
  type = map(object({
subnet_name = string
vnet_name = string
nsg_name = string
rg_name = string
  }))
}