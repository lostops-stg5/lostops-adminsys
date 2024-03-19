# -----------------------------------------------------------------
#                         Project context
# -----------------------------------------------------------------

variable "dev_lab_name" {
  default     = "t-nsa-800-stg-2"
  description = "The dev lab name to be used."
  type        = string
  nullable    = false
}

variable "ressource_group_name" {
  default     = "t-nsa-800-stg-2"
  description = "The ressource group that own all ressources. DONT FORGET TO UPDATE BACKEND CONFIG IN VERSIONS.TF !"
  type        = string
  nullable    = false
}

variable "ressource_group_name_items" {
  default     = "t-nsa-800-stg-2-items"
  description = "The ressource group that own all items."
  type        = string
  nullable    = false
}

# -----------------------------------------------------------------
#      Backup context (only if you dont have storage container)
# -----------------------------------------------------------------

variable "storage_account_name" {
  default     = "atnsa800stg26523"
  description = "The storage account name that will be used to store backups. DONT FORGET TO UPDATE BACKEND CONFIG IN VERSIONS.TF !"
  type        = string
  nullable    = false
}

variable "storage_container_name" {
  default     = "artifacts"
  description = "The storage container that own all custom scripts for virtual machine setup."
  type        = string
  nullable    = false
}

# -----------------------------------------------------------------
#                         Network context
# -----------------------------------------------------------------
variable "network_name" {
  default     = "t-nsa-800-stg-2"
  description = "The name of the network provided on azure dev test lab."
  type        = string
  nullable    = false
}

# -----------------------------------------------------------------
#                         Security context
# -----------------------------------------------------------------
variable "vault_name" {
  default     = "tnsa800stg2322"
  description = "The name of the vault used to store keys."
  type        = string
  nullable    = false
}

variable "key_name" {
  default     = "group-stg-2_rsa"
  description = "The name of the vault used to store keys."
  type        = string
  nullable    = false
}
