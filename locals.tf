locals {
  spark_pools = {
    CapaDeServicio = {
      node_size_family                    = "MemoryOptimized"
      node_size                           = "Small"
      spark_version                       = "3.5"
      auto_scale_enabled                  = true
      node_count                          = null
      min_node_count                      = 3
      max_node_count                      = 5
      auto_pause_enabled                  = true
      auto_pause_minutes                  = 15
      dynamic_executor_allocation_enabled = false
      compute_isolation_enabled           = false
      session_level_packages_enabled      = false
      tags = {
        Tipo = "Tecnico"
      }
    }

    SparkMana = {
      node_size_family                    = "MemoryOptimized"
      node_size                           = "Small"
      spark_version                       = "3.4"
      auto_scale_enabled                  = false
      node_count                          = 10
      min_node_count                      = null
      max_node_count                      = null
      auto_pause_enabled                  = true
      auto_pause_minutes                  = 15
      dynamic_executor_allocation_enabled = false
      compute_isolation_enabled           = false
      session_level_packages_enabled      = false
      tags                                = {}
    }

    SparkPeople = {
      node_size_family                    = "MemoryOptimized"
      node_size                           = "Medium"
      spark_version                       = "3.4"
      auto_scale_enabled                  = true
      node_count                          = null
      min_node_count                      = 3
      max_node_count                      = 20
      auto_pause_enabled                  = true
      auto_pause_minutes                  = 15
      dynamic_executor_allocation_enabled = false
      compute_isolation_enabled           = false
      session_level_packages_enabled      = false
      tags = {
        Reporte = "People"
      }
    }

    grupoSparkTest = {
      node_size_family                    = "MemoryOptimized"
      node_size                           = "Small"
      spark_version                       = "3.4"
      auto_scale_enabled                  = false
      node_count                          = 3
      min_node_count                      = null
      max_node_count                      = null
      auto_pause_enabled                  = true
      auto_pause_minutes                  = 5
      dynamic_executor_allocation_enabled = false
      compute_isolation_enabled           = false
      session_level_packages_enabled      = false
      tags                                = {}
    }
  }
}
