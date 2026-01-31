rg = {
  "name1" = {
    rg_name     = "rg1"
    rg_location = "westus"
  }
}
vnet = {
  "vnet1" = {
    vnet_name     = "vnet1"
    rg_name       = "rg1"
    rg_location   = "westus"
    address_space = ["10.0.0.0/16"]
    subnet = {
      "subnet1" = {
        subnet_name      = "subnet1"
        address_prefixes = ["10.0.1.0/24"]

      }
      "subnet2" = {
        subnet_name      = "subnet2"
        address_prefixes = ["10.0.2.0/24"]

      }
      "subnet3" = {
        subnet_name      = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/24"]

      }
      "subnet4" = {
        subnet_name      = "Subnet4"
        address_prefixes = ["10.0.4.0/24"]

      }
    }

  }
}

pip = {
  "pip1" = {
    pip_name          = "pip1"
    rg_name           = "rg1"
    rg_location       = "westus"
    allocation_method = "Static"
    sku               = "Standard"
  }

  "pip2" = {
    pip_name          = "pip2"
    rg_name           = "rg1"
    rg_location       = "westus"
    allocation_method = "Static"
    sku               = "Standard"
  }
}
nic = {
  "nic1" = {
    nic_name    = "nic1"
    rg_location = "westus"
    rg_name     = "rg1"
    subnet_name = "subnet1"
    vnet_name   = "vnet1"
    ip_configuration = {
      "ipconfig1" = {
        ip_config_name                = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    }
    vm_name = "vm1"
    vm_size = "Standard_D2s_v3"

    source_image_reference = {
      "image1" = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    }
    os_disk = {
      "osdisk1" = {
        caching           = "ReadWrite"
        managed_disk_type = "Standard_LRS"
      }

    }

  }
  #   "nic2" = {
  #     nic_name    = "nic2"
  #     rg_location = "westus"
  #     rg_name     = "rg1"
  #     subnet_name = "subnet1"
  #     vnet_name   = "vnet1"
  #      ip_configuration = {
  #       "ipconfig1" = {
  #         ip_config_name                = "ipconfig1"
  #         private_ip_address_allocation = "Dynamic"
  #       }
  #     }
  #     vm_name = "vm2"
  #     vm_size = "Standard_D2s_v3"

  #     source_image_reference = {
  #       "image1" = {
  #         publisher = "Canonical"
  #         offer     = "0001-com-ubuntu-server-jammy"
  #         sku       = "22_04-LTS"
  #         version   = "latest"
  #       }
  #     }
  #     os_disk = {
  #       "osdisk1" = {
  #         caching           = "ReadWrite"
  #         managed_disk_type = "Standard_LRS"
  #       }

  #     }

  #   }
  #   "nic3" = {
  #     nic_name    = "nic3"
  #     rg_location = "westus"
  #     rg_name     = "rg1"
  #     subnet_name = "subnet2"
  #     vnet_name   = "vnet1"
  #     ip_configuration = {
  #       "ipconfig1" = {
  #         ip_config_name                = "ipconfig1"
  #         private_ip_address_allocation = "Dynamic"
  #       }
  #     }
  #     vm_name = "vm3"
  #     vm_size = "Standard_D2s_v3"

  #     source_image_reference = {
  #       "image1" = {
  #         publisher = "Canonical"
  #         offer     = "0001-com-ubuntu-server-jammy"
  #         sku       = "22_04-LTS"
  #         version   = "latest"
  #       }
  #     }
  #     os_disk = {
  #       "osdisk1" = {
  #         caching           = "ReadWrite"
  #         managed_disk_type = "Standard_LRS"
  #       }

  #     }

  #   }
  "nic4" = {
    nic_name    = "nic4"
    rg_location = "westus"
    rg_name     = "rg1"
    subnet_name = "subnet2"
    vnet_name   = "vnet1"
    ip_configuration = {
      "ipconfig1" = {
        ip_config_name                = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    }
    vm_name = "vm4"
    vm_size = "Standard_D2s_v3"

    source_image_reference = {
      "image1" = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    }
    os_disk = {
      "osdisk1" = {
        caching           = "ReadWrite"
        managed_disk_type = "Standard_LRS"
      }

    }

  }
}
bastion = {
  bastion1 = {
    bastion_name     = "bastion1"
    bastion_location = "westus"
    rg_name          = "rg1"
    vnet_name        = "vnet1"
    subnet_name      = "AzureBastionSubnet"
    public_ip_name   = "pip1"
    ip_configurations = {
      "config1" = {
        ip_config_name = "config1"
      }
    }
  }
}
nsg = {
  nsg1 = {
    nsg_name     = "nsg1"
    nsg_location = "westus"
    rg_name      = "rg1"
    security_rules = {
      "rule1" = {
        name                   = "rule1"
        priority               = 100
        direction              = "Inbound"
        access                 = "Allow"
        protocol               = "Tcp"
        destination_port_range = "22"
      }
      "rule2" = {
        name                   = "rule2"
        priority               = 101
        direction              = "Inbound"
        access                 = "Allow"
        protocol               = "Tcp"
        destination_port_range = "80"
      }
      "rule3" = {
        name                   = "allow-azure-lb"
        priority               = 110
        direction              = "Inbound"
        access                 = "Allow"
        protocol               = "*"
        source_address_prefix  = "AzureLoadBalancer"
        destination_port_range = "*"
      }
    }
  }
}
nsg_association = {
  "association1" = {
    subnet_name = "subnet1"
    vnet_name   = "vnet1"
    nsg_name    = "nsg1"
    rg_name     = "rg1"
  }
  "association2" = {
    subnet_name = "subnet2"
    vnet_name   = "vnet1"
    nsg_name    = "nsg1"
    rg_name     = "rg1"
  }
}
loadbalancer = {
  "lb1" = {
    lb_name                        = "lb1"
    lb_location                    = "westus"
    rg_name                        = "rg1"
    sku                            = "Standard"
    subnet_name                    = "subnet1"
    vnet_name                      = "vnet1"
    backend_address_pool_name      = "backendpool1"
    probe_name                     = "healthprobe1"
    probe_port                     = 80
    lb_rule_name                   = "lbrule1"
    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration_name = "frontendconfig1"
    frontend_ip_configuration = {
      "frontendconfig1" = {
        frontend_ipconfiname          = "frontendconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}
vm2_backend_attach = {
  "attach1" = {
    ip_configuration_name = "ipconfig1"
    nic_name              = "nic4"
    loadbalancer_name     = "lb1"
    backend_pool_name     = "backendpool1"
    rg_name               = "rg1"
  }
}
appgateway = {
  "aap1" = {
    appgateway_name = "appgateway1"
    rg_name         = "rg1"
    rg_location     = "westus"
    vnet_name       = "vnet1"
    subnet_name     = "subnet4"
    public_ip_name  = "pip2"
    sku = {
      "sku1" = {
        sku_name     = "Standard_v2"
        sku_tier     = "Standard_v2"
        sku_capacity = 2
      }
    }
    gateway_ip_configuration = {
      "gwipconfig1" = {
        gateway_ipname = "gwipconfig1"
      }
    }
    frontend_port = {
      "frontendport1" = {
        name = "frontendport1"
        port = 80
      }
    }
    frontend_ip_configuration = {
      "frontendipconfig1" = {
        frontend_ipconfiname = "frontendipconfig1"
      }
    }
    backend_address_pool = {
      "backendpool1" = {
        aapgatway_backendpool_name = "backendpool1"
      }
    }
    backend_http_settings = {
      "httpsetting1" = {
        http_name             = "httpsetting1"
        cookie_based_affinity = "Enabled"
      }
    }
    http_listener = {
      "listener1" = {
        listener_name                  = "listener1"
        frontend_ip_configuration_name = "frontendipconfig1"
        frontend_port_name             = "frontendport1"
      }
    }
    request_routing_rule = {
      "routingrule1" = {
        routing_name               = "routingrule1"
        http_listener_name         = "listener1"
        backend_address_pool_name  = "backendpool1"
        backend_http_settings_name = "httpsetting1"
      }
    }

  }
}
nic_aapgatway = {
  "nic1" = {
    ip_configuration_name      = "ipconfig1"
    nic_name                   = "nic1"
    rg_name                    = "rg1"
    aapgatway_backendpool_name = "backendpool1"
    appgateway_name            = "appgateway1"
  }
}
