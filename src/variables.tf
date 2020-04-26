variable "gateway_name" {
  default = "__gateway_name__"
}

variable "public_ip_name" {
  default = "__public_ip_name__"
}

variable "resource_group_location" {
  default = "__resource_group_location__"
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
    location    = "__tags_location__"
    managedBy   = "__tags_managed_by__"
  }
}
