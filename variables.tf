variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "batch_accounts" {
  description = "Map of Batch accounts to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-batch-batchaccount/azurerm v0.2.0 (https://registry.terraform.io/modules/Azure/avm-res-batch-batchaccount/azurerm/0.2.0) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                    = string
    tags                                    = optional(map(string))
    enable_telemetry                        = optional(bool)
    network_profile                         = optional(any, null)
    role_assignments                        = optional(any, null)
    storage_account_node_identity           = optional(string, null)
    key_vault_reference                     = optional(any, null)
    managed_identities                      = optional(any, null)
    private_endpoints                       = optional(any, null)
    private_endpoints_manage_dns_zone_group = optional(bool, null)
    allowed_authentication_modes            = optional(list(string), null)
    public_network_access_enabled           = optional(bool, null)
    storage_account_id                      = string
    encryption                              = optional(any, null)
    identity                                = optional(any, null)
    pool_allocation_mode                    = optional(string, null)
    storage_account_authentication_mode     = optional(string, null)
    lock                                    = optional(any, null)
  }))
  default = {}
}
