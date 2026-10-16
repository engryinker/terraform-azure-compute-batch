# terraform-azure-compute-batch

Org-standard Terraform wrapper for: **Batch accounts**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/engryinker/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/engryinker/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "compute-batch" {
  source = "git::https://github.com/engryinker/terraform-azure-compute-batch.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  batch_accounts = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `batch_accounts` (Batch accounts)

Wraps [Azure/avm-res-batch-batchaccount/azurerm](https://registry.terraform.io/modules/Azure/avm-res-batch-batchaccount/azurerm/0.2.0) v0.2.0.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `network_profile` | `any` | no |  |
| `role_assignments` | `any` | no |  |
| `storage_account_node_identity` | `string` | no |  |
| `key_vault_reference` | `any` | no |  |
| `managed_identities` | `any` | no |  |
| `private_endpoints` | `any` | no |  |
| `private_endpoints_manage_dns_zone_group` | `bool` | no |  |
| `allowed_authentication_modes` | `list(string)` | no |  |
| `public_network_access_enabled` | `bool` | no |  |
| `storage_account_id` | `string` | yes |  |
| `encryption` | `any` | no |  |
| `identity` | `any` | no |  |
| `pool_allocation_mode` | `string` | no |  |
| `storage_account_authentication_mode` | `string` | no |  |
| `lock` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `batch_accounts` -- map (same keys as the input) of every output from each created Batch accounts.
