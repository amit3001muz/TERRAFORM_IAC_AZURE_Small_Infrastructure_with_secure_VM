#This is module block for resource group where all resource inside that resource group.
module "rg" {
  source = "../../modules/RG"
  rg     = var.rg
}
#This is virtual \network for Azure
module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/vnet"
  vnet       = var.vnet

}
#This is Public ip for NIC
module "pip" {
  depends_on = [module.rg]
  source     = "../../modules/pip"
  pip        = var.pip
}
#This is NIC for VM
module "computing" {
  depends_on = [module.rg, module.vnet, ]
  source     = "../../modules/vm"
  nic        = var.nic
}
module "bastion" {
  depends_on = [module.rg, module.vnet, module.pip]
  source     = "../../modules/basation"
  bastion    = var.bastion
}
module "nsg" {
  depends_on = [module.rg]
  source     = "../../modules/nsg"
  nsg        = var.nsg

}
module "nsg_association" {
  depends_on      = [module.nsg, module.vnet, module.rg]
  source          = "../../modules/nsgassociation"
  nsg_association = var.nsg_association

}
module "lb" {
  depends_on   = [module.rg, module.vnet, module.computing, module.nsg]
  source       = "../../modules/loadblancer"
  loadbalancer = var.loadbalancer
}
module "vm2_backpool_association" {
  depends_on         = [module.lb, module.computing]
  source             = "../../modules/backpoolassociation"
  vm2_backend_attach = var.vm2_backend_attach

}
module "appgateway" {
  depends_on = [module.rg, module.vnet, module.pip, module.computing, module.nsg]
  source     = "../../modules/appgatway"
  appgateway = var.appgateway
}
# module "appgatway_association" {
#   depends_on    = [module.appgateway, module.computing]
#   source        = "../../modules/appassociationvm"
#   nic_aapgatway = var.nic_aapgatway

# }