# Suscripción destino
subscription_id = "abfc4876-4cfd-4f7a-8bbe-fec4694d3228"

# Reemplazar con el nombre real del nuevo Resource Group
resource_group_name = "rg-reporte-prod-brazilsouth-01"
location            = "brazilsouth"

# Los nombres de Storage y Synapse deben estar disponibles globalmente.
# Para un despliegue paralelo no podrás usar los nombres actuales mientras sigan existiendo.
storage_account_name   = "stadbreportedest01" 
synapse_filesystem_name = "synapse"
synapse_workspace_name  = "syn-db-reporte-dest01"

synapse_sql_administrator_login = "sqladminuser"

# Entregar la contraseña por variable de entorno, no guardarla aquí:
# PowerShell:
synapse_sql_administrator_password = "2LPu8xLQ8Dt34CK9GDFokzs"

# Ajustar estos valores luego de confirmar la configuración real del ambiente origen.
synapse_managed_virtual_network_enabled = false
synapse_public_network_access_enabled    = true
storage_public_network_access_enabled    = true

# Databricks identificado en el inventario
# El nombre puede conservarse si Azure lo permite en el alcance destino.
databricks_workspace_name                 = "dbr-db-reporte-dest01"
databricks_sku                            = "standard"
databricks_public_network_access_enabled  = true

common_tags = {
  Environment = "Production"
  Migration   = "Subscription"
}
