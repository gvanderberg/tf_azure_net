variable "address_space" {
  default = "__address_space__"
}

variable "location" {
  default = "__location__"
}

variable "resource_group_create" {
  default = "__resource_group_create__"
}

variable "resource_group_name" {
  default = "__resource_group_name__"
}

variable "subnet_name_prefix" {
  default = "__subnet_name_prefix__"
}

variable "virtual_network_name" {
  default = "__virtual_network_name__"
}

variable "tags" {
  default = {
    createdBy   = "Terraform"
    environment = "__tags_environment__"
    location    = "__tags_location__"
    managedBy   = "__tags_managed_by__"
  }
}
