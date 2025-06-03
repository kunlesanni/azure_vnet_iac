module "vnet" {
  source      = "./modules"
  vnet        = local.vnet
  all_subnets = local.all_subnets
  all_nsgs    = local.all_nsgs
}

