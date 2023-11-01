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
variable  "vnicpublicid" {
  #default = ""
  description = "Virtual network interface ID"
}

variable  "vnicprivateid" {
  #default = ""
  description = "Virtual network interface ID"
}
variable "admin_username" {
  description = "Admin username for VM"
  default     = "adminuser"
}

variable "publiccount" {
  description = "Number of public virtual machines to create"
  type        = number
  default     = 1
}

variable "privatecount" {
  description = "Number of private virtual machines to create"
  type        = number
  default     = 1
}