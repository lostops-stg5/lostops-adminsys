# -----------------------------------------------------------------
#                         Project context
# -----------------------------------------------------------------

variable "dev_lab_name" {
  default     = ""
  description = "The dev lab name to be used."
  type        = string
  nullable    = false
}

variable "ressource_group_name" {
  default     = ""
  description = "The ressource group that own all ressources. DONT FORGET TO UPDATE BACKEND CONFIG IN VERSIONS.TF !"
  type        = string
  nullable    = false
}

# -----------------------------------------------------------------
#                         Backup context
# -----------------------------------------------------------------

variable "storage_account_name" {
  default     = "lostops_storage_account"
  description = "The storage account name that will be used to store backups. DONT FORGET TO UPDATE BACKEND CONFIG IN VERSIONS.TF !"
  type        = string
  nullable    = false
}

variable "storage_container_name" {
  default     = "tfstate_container"
  description = "The container name that will store tfstate files. DONT FORGET TO UPDATE BACKEND CONFIG IN VERSIONS.TF !"
  type        = string
  nullable    = false
}
