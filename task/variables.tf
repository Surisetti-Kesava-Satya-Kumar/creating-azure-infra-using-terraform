variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "prod-rg" # You can change the default value
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "East US" # You can change the default value
}

variable "environment" {
  description = "Environment (prod/qa)."
  type        = string
  default     = "prod" # Set to "qa" for the QA environment
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