data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "batch_account" {
  source   = "Azure/avm-res-batch-batchaccount/azurerm"
  version  = "0.2.0"
  for_each = var.batch_accounts

  name                                    = each.value.name
  location                                = var.location
  resource_group_name                     = var.resource_group_name
  tags                                    = coalesce(each.value.tags, var.tags)
  enable_telemetry                        = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  network_profile                         = each.value.network_profile
  role_assignments                        = each.value.role_assignments
  storage_account_node_identity           = each.value.storage_account_node_identity
  key_vault_reference                     = each.value.key_vault_reference
  managed_identities                      = each.value.managed_identities
  private_endpoints                       = each.value.private_endpoints
  private_endpoints_manage_dns_zone_group = each.value.private_endpoints_manage_dns_zone_group
  allowed_authentication_modes            = each.value.allowed_authentication_modes
  public_network_access_enabled           = each.value.public_network_access_enabled
  storage_account_id                      = each.value.storage_account_id
  encryption                              = each.value.encryption
  identity                                = each.value.identity
  pool_allocation_mode                    = each.value.pool_allocation_mode
  storage_account_authentication_mode     = each.value.storage_account_authentication_mode
  lock                                    = each.value.lock
}
