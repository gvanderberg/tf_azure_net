variable "location" {
  default = "__location__"
}

variable "network_security_group_name" {
  default = "__network_security_group_name__"
}

variable "resource_group_name" {
  default = "__resource_group_name__"
}

variable "virtual_network_name" {
  default = "__virtual_network_name__"
}

variable "tags" {
  default = {
    createdBy   = "__tags_created_by__"
    environment = "__tags_environment__"
    managedBy   = "__tags_managed_by__"
  }
}
