resource "azurerm_synapse_spark_pool" "pool" {
  for_each = local.spark_pools

  name                 = each.key
  synapse_workspace_id = azurerm_synapse_workspace.main.id
  node_size_family     = each.value.node_size_family
  node_size            = each.value.node_size
  spark_version        = each.value.spark_version

  node_count = each.value.auto_scale_enabled ? null : each.value.node_count

  dynamic "auto_scale" {
    for_each = each.value.auto_scale_enabled ? [1] : []

    content {
      min_node_count = each.value.min_node_count
      max_node_count = each.value.max_node_count
    }
  }

  dynamic "auto_pause" {
    for_each = each.value.auto_pause_enabled ? [1] : []

    content {
      delay_in_minutes = each.value.auto_pause_minutes
    }
  }

  dynamic_executor_allocation_enabled = each.value.dynamic_executor_allocation_enabled
  compute_isolation_enabled           = each.value.compute_isolation_enabled
  session_level_packages_enabled      = each.value.session_level_packages_enabled

  tags = merge(var.common_tags, each.value.tags)
}
