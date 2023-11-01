variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}
variable "environment" {
  description = "Environment (prod/qa)."
  type        = string
  #default     = "prod" # Set to "qa" for the QA environment
}


