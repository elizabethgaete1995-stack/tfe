resource "azurerm_role_assignment" "synapse_storage_blob_data_contributor" {
  scope                = azurerm_storage_account.synapse.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_synapse_workspace.main.identity[0].principal_id
}
