locals {
  vnets_file = file("${path.module}/vnets.yaml")
  vnets      = yamldecode(local.vnets_file).vnets
  vnet = {
    for vnet in local.vnets : "vnet-${vnet.name}-${var.env_prefix}" => vnet
  }


#   rgs_file = file("${path.module}/variables/rgs.yaml")
#   rgs      = yamldecode(local.rgs_file).rgs
#   rg = {
#     for rg in local.rgs : "${rg.name}-${var.env_prefix}" => rg
#   }


  # Flatten subnets and their respective NSGs for easier iteration
#   all_subnets = flatten([
#     for vnet in local.vnets : [
#       for subnet in vnet.subnets : {
#         vnet_name               = "vnet-${vnet.name}-${var.env_prefix}"
#         subnet_name             = "sn-${subnet.name}-${var.env_prefix}"
#         cidr                    = subnet.cidr
#         rg                      = vnet.rg
#         location                = vnet.location
#         service_delegation      = subnet.service_delegation
#         service_delegation_name = subnet.service_delegation_name
#         nsgs                    = subnet.nsgs
#       }
#     ]
#   ])

  all_subnets =  {for vnet in local.vnets : 
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

#   # Map of private DNS zones from the yaml file
#   private_dns_zones_file = file("${path.module}/variables/private_dns_zones.yaml")
#   private_dns_zones      = yamldecode(local.private_dns_zones_file).private_dns_zones
#   private_dns_zone = {
#     for pdz in local.private_dns_zones : pdz.name => pdz
#   }





#   admin_users_file = file("${path.module}/variables/users.yaml")
#   admin_users      = yamldecode(local.admin_users_file).admin_users
#   users            = yamldecode(local.admin_users_file).users
#   # admin_user = [for email in local.admin_users : email]



  # Flatten resource groups for easier iteration
  # all_rgs = flatten([
  #   for rg in local.rgs : [
  #     {
  #       rg_name   = rg.name
  #       location  = rg.location
  #       lock_level = rg.lock_level
  #       # tags      = local.rg_tags[rg.name]
  #       }
  #   ]
  # ])

  # all_rgs = {
  #   for rg in local.rgs : rg.name => {
  #     location  = rg.location
  #     lock_level = rg.lock_level
  #   }
  # }
}
output "all_subnets" {
  value = local.all_subnets
}