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

variable "public_subnets" {
  description = "References to public subnets from the network module."
  type        = map(any)
}

variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  description = "The values for each NSG rule "
} 


