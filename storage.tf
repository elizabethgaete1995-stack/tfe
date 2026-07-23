resource "azurerm_storage_account" "synapse" {
  name                          = var.storage_account_name
  resource_group_name           = azurerm_resource_group.main.name
  location                      = azurerm_resource_group.main.location
  account_kind                  = "StorageV2"
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  is_hns_enabled                = true
  public_network_access_enabled = var.storage_public_network_access_enabled

  tags = var.common_tags
}

resource "azurerm_storage_data_lake_gen2_filesystem" "synapse" {
  name               = var.synapse_filesystem_name
  storage_account_id = azurerm_storage_account.synapse.id
}
