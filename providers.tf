terraform {
/*  # If using Terraform Cloud, configure the backend to here
  cloud {
    organization = "your_terraform_organization"
    workspaces {
      name = "infrastructure"
    }
  }
*/
  required_version = ">= 0.15"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.39.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.1"
    }
  }
}

provider "azuread" {
  # Configuration options
}

provider "azurerm" {
  # Configuration options
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = "15082201-a671-4e77-b701-c2f9ffb6d1ac"
}