# Define the Virtual Networks
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet
  name                = each.key
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.rg
}

resource "azurerm_subnet" "subnet" {
  for_each = var.all_subnets

  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg
  virtual_network_name = each.value.vnet_name
  address_prefixes     = [each.value.cidr]

  dynamic "delegation" {
    for_each = each.value.service_delegation ? [1] : []
    content {
      name = "delegation"
      service_delegation {
        name    = each.value.service_delegation_name
        actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      }
    }
  }
  lifecycle {
    ignore_changes = [delegation]
  }
}


resource "azurerm_network_security_group" "nsg" {
  for_each = {
    for nsg in var.all_nsgs : "${nsg.vnet_name}-${nsg.nsg_name}" => nsg
  }

  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg

  dynamic "security_rule" {
    for_each = { for rule in each.value.nsgrules : rule.name => rule }
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.sourcePortRange
      destination_port_range     = security_rule.value.destinationPortRange
      source_address_prefix      = security_rule.value.sourceAddressPrefix
      destination_address_prefix = security_rule.value.destinationAddressPrefix
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  for_each = {
    for subnet_key, subnet in var.all_subnets :
    subnet_key => subnet
    if length(subnet.nsgs) > 0
  }

  subnet_id                 = azurerm_subnet.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg["${each.value.vnet_name}-${each.value.nsgs[0].name}"].id
}

