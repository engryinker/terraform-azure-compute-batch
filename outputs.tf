output "batch_accounts" {
  description = "Map (same keys as var.batch_accounts) of every output from each Batch accounts created -- see upstream module docs for the full shape."
  value       = module.batch_account
}
