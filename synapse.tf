resource "azurerm_synapse_workspace" "main" {
  name                                 = var.synapse_workspace_name
  resource_group_name                  = azurerm_resource_group.main.name
  location                             = azurerm_resource_group.main.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.synapse.id

  sql_administrator_login          = var.synapse_sql_administrator_login
  sql_administrator_login_password = var.synapse_sql_administrator_password

  managed_virtual_network_enabled = var.synapse_managed_virtual_network_enabled
  public_network_access_enabled    = var.synapse_public_network_access_enabled

  identity {
    type = "SystemAssigned"
  }

  tags = var.common_tags
}
