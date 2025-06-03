locals {
  vnets_file = file("${path.module}/vnets.yaml")
  vnets      = yamldecode(local.vnets_file).vnets
  vnet = {
    for vnet in local.vnets : "vnet-${vnet.name}-${var.env_prefix}" => vnet
  }

  # Flatten subnets for easier iteration
  all_subnets = {
    for subnet in flatten([
      for vnet in local.vnets : [
        for subnet in vnet.subnets : {
          vnet_name               = "vnet-${vnet.name}-${var.env_prefix}"
          subnet_name             = "sn-${subnet.name}-${var.env_prefix}"
          cidr                    = subnet.cidr
          rg                      = vnet.rg
          location                = vnet.location
          service_delegation      = subnet.service_delegation
          service_delegation_name = subnet.service_delegation_name
          nsgs                    = subnet.nsgs
        }
      ]
    ]) : "${subnet.vnet_name}-${subnet.subnet_name}" => subnet
  }

  # Flatten NSGs for easier iteration
  all_nsgs = flatten([
    for vnet in local.vnets : [
      for subnet in vnet.subnets : [
        for nsg in subnet.nsgs : {
          vnet_name   = "vnet-${vnet.name}-${var.env_prefix}"
          subnet_name = "sn-${subnet.name}-${var.env_prefix}"
          nsg_name    = nsg.name
          location    = vnet.location
          rg          = vnet.rg
          nsgrules    = nsg.nsgrules
        }
      ]
    ]
  ])
}

