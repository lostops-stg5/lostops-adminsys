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
  description = "The ressource group that own all ressources."
  type        = string
  nullable    = false
}
