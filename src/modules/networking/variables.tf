variable "network_security_group_name" {
  description = "The name of the network security group"
  type        = "string"
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = "string"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = "string"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = "string"
}

variable "tags" {
  description = "The tags to use for this resource"
  type        = "map"
}
