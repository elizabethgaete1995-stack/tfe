variable "subscription_id" {
  description = "ID de la suscripción Azure de destino."
  type        = string
}

variable "resource_group_name" {
  description = "Nombre del nuevo Resource Group."
  type        = string
}

variable "location" {
  description = "Región de despliegue. Se mantiene Brazil South por defecto."
  type        = string
  default     = "brazilsouth"
}

variable "storage_account_name" {
  description = "Nombre globalmente único del Storage Account ADLS Gen2 usado por Synapse."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "El nombre del Storage Account debe tener entre 3 y 24 caracteres y usar solo minúsculas y números."
  }
}

variable "synapse_filesystem_name" {
  description = "Nombre del filesystem/contenedor ADLS Gen2 asociado al Synapse Workspace."
  type        = string
}

variable "synapse_workspace_name" {
  description = "Nombre globalmente único del Synapse Workspace."
  type        = string
}

variable "synapse_sql_administrator_login" {
  description = "Usuario administrador SQL de Synapse."
  type        = string
  default     = "sqladminuser"
}

variable "synapse_sql_administrator_password" {
  description = "Contraseña del administrador SQL de Synapse. Entregar mediante variable de entorno TF_VAR_synapse_sql_administrator_password."
  type        = string
  sensitive   = true
}

variable "synapse_managed_virtual_network_enabled" {
  description = "Indica si Synapse usa Managed Virtual Network. Debe ajustarse al valor del ambiente origen."
  type        = bool
  default     = false
}

variable "synapse_public_network_access_enabled" {
  description = "Indica si Synapse permite acceso por red pública. Debe ajustarse al valor del ambiente origen."
  type        = bool
  default     = true
}

variable "databricks_workspace_name" {
  description = "Nombre del Azure Databricks Workspace."
  type        = string
  default     = "pro-db-reporte"
}

variable "databricks_sku" {
  description = "SKU del Databricks Workspace."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium", "trial"], lower(var.databricks_sku))
    error_message = "databricks_sku debe ser standard, premium o trial."
  }
}

variable "databricks_public_network_access_enabled" {
  description = "Indica si el Databricks Workspace permite acceso público. Debe ajustarse al ambiente origen."
  type        = bool
  default     = true
}

variable "storage_public_network_access_enabled" {
  description = "Indica si el Storage Account permite acceso público de red. Debe ajustarse al ambiente origen."
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Tags comunes para los recursos desplegados."
  type        = map(string)
  default     = {}
}
