resource "azurerm_databricks_workspace" "main" {
  name                          = var.databricks_workspace_name
  resource_group_name           = azurerm_resource_group.main.name
  location                      = azurerm_resource_group.main.location
  sku                           = lower(var.databricks_sku)
  public_network_access_enabled = var.databricks_public_network_access_enabled

  tags = merge(var.common_tags, {
    Reporte = "People"
  })
}
