# Terraform: migración de plataforma analítica Azure

Este proyecto crea en una suscripción de destino:

- Un Resource Group nuevo en Brazil South.
- Un Storage Account `StorageV2`, `Standard_LRS`, con ADLS Gen2 habilitado.
- Un filesystem ADLS Gen2 para Azure Synapse.
- Un Azure Synapse Workspace con identidad administrada `SystemAssigned`.
- Los cuatro Spark Pools con la configuración inventariada.
- Un Azure Databricks Workspace `standard`.
- El rol `Storage Blob Data Contributor` para la identidad administrada de Synapse sobre el Storage Account.

## Spark Pools incluidos

| Pool | Spark | Nodo | Escalamiento | Auto Pause |
|---|---|---|---|---|
| `CapaDeServicio` | 3.5 | MemoryOptimized Small | 3-5 nodos | 15 min |
| `SparkMana` | 3.4 | MemoryOptimized Small | 10 nodos fijos | 15 min |
| `SparkPeople` | 3.4 | MemoryOptimized Medium | 3-20 nodos | 15 min |
| `grupoSparkTest` | 3.4 | MemoryOptimized Small | 3 nodos fijos | 5 min |

En todos los pools se mantiene:

- Dynamic Executor Allocation: deshabilitado.
- Compute Isolation: deshabilitado.
- Session-level packages: deshabilitado.
- Autotune: no se declara porque AzureRM no expone ese argumento en este recurso y el valor inventariado es `false`.

## Supuestos que debes validar

El inventario entregado no permite confirmar todavía:

- Si Synapse utiliza Managed Virtual Network.
- Si Synapse, Storage o Databricks tienen acceso público deshabilitado.
- Private Endpoints, Private DNS Zones, VNets, subnets, NSG o rutas.
- Nombre real del filesystem ADLS Gen2 asociado a Synapse.
- Git integration, linked services, notebooks, pipelines, triggers, librerías y archivos de configuración Spark.
- Configuración interna de Databricks: notebooks, jobs, clusters, secret scopes, permisos y Unity Catalog.

Los valores de red quedan parametrizados en `terraform.tfvars.example` y deben ajustarse antes del despliegue.

## Nombres globales

El nombre del Storage Account y el nombre del Synapse Workspace deben estar disponibles globalmente. Para un despliegue paralelo tendrás que usar nombres temporales o diferentes mientras los recursos originales sigan existiendo.

## Prerrequisitos

- Terraform 1.6 o superior.
- Azure CLI autenticado en el tenant correcto.
- Permisos para crear recursos y asignaciones RBAC en la suscripción destino.
- Cuota suficiente para los Spark Pools en Brazil South.
- Providers registrados, especialmente `Microsoft.Storage`, `Microsoft.Synapse`, `Microsoft.Databricks` y `Microsoft.Authorization`.
- El usuario o Service Principal que ejecuta Terraform necesita permisos de datos suficientes para crear el filesystem ADLS Gen2.

## Uso

1. Copia el archivo de variables:

```powershell
Copy-Item terraform.tfvars.example terraform.tfvars
```

2. Edita `terraform.tfvars` y completa la suscripción, los nombres globales y la configuración de red.

3. Entrega la contraseña de Synapse como variable de entorno:

```powershell
$env:TF_VAR_synapse_sql_administrator_password = "REEMPLAZAR_POR_UNA_CONTRASEÑA_SEGURA"
```

4. Inicia y valida:

```powershell
terraform init
terraform fmt -recursive
terraform validate
terraform plan -out migration.tfplan
```

5. Revisa el plan y aplica:

```powershell
terraform apply migration.tfplan
```

## Lo que este Terraform no migra

Terraform crea la infraestructura ARM, pero no copia automáticamente:

- Datos del Storage Account.
- Notebooks, pipelines, datasets, linked services y triggers de Synapse.
- Librerías o configuración personalizada de cada Spark Pool.
- Notebooks, jobs, clusters, secret scopes, grupos y permisos de Databricks.
- RBAC adicional, ACL de carpetas ADLS, conexiones externas y secretos.

Estos componentes deben tratarse en un runbook de migración posterior.
