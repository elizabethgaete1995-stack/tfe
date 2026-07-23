output "resource_group_id" {
  description = "ID del Resource Group creado."
  value       = azurerm_resource_group.main.id
}

output "storage_account_id" {
  description = "ID del Storage Account ADLS Gen2."
  value       = azurerm_storage_account.synapse.id
}

output "storage_account_name" {
  description = "Nombre del Storage Account ADLS Gen2."
  value       = azurerm_storage_account.synapse.name
}

output "synapse_workspace_id" {
  description = "ID del Synapse Workspace."
  value       = azurerm_synapse_workspace.main.id
}

output "synapse_workspace_identity_principal_id" {
  description = "Principal ID de la identidad administrada del Synapse Workspace."
  value       = azurerm_synapse_workspace.main.identity[0].principal_id
}

output "synapse_connectivity_endpoints" {
  description = "Endpoints generados para el Synapse Workspace."
  value       = azurerm_synapse_workspace.main.connectivity_endpoints
}

output "spark_pool_ids" {
  description = "IDs de los cuatro Spark Pools."
  value       = { for name, pool in azurerm_synapse_spark_pool.pool : name => pool.id }
}

output "databricks_workspace_id" {
  description = "ID ARM del Databricks Workspace."
  value       = azurerm_databricks_workspace.main.id
}

output "databricks_workspace_url" {
  description = "URL del Databricks Workspace."
  value       = azurerm_databricks_workspace.main.workspace_url
}
