# --------------------------------------------------------------
variable "client_id" {
  default = "__client_id__"
  type    = "string"
}

variable "client_secret" {
  default = "__client_secret__"
  type    = "string"
}

variable "subscription_id" {
  default = "__subscription_id__"
  type    = "string"
}

variable "tenant_id" {
  default = "__tenant_id__"
  type    = "string"
}
# --------------------------------------------------------------

variable "network_security_group_name" {
  default = "__network_security_group_name__"
  type    = "string"
}

variable "region" {
  default = "__region__"
  type    = "string"
}

variable "resource_group_name" {
  default = "__resource_group_name__"
  type    = "string"
}

variable "virtual_network_name" {
  default = "__virtual_network_name__"
  type    = "string"
}

variable "tags" {
  default = {
    createdBy   = "__tags_created_by__"
    environment = "__tags_environment__"
    managedBy   = "__tags_managed_by__"
  }
  type = "map"
}
