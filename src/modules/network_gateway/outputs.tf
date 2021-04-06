output "id" {
  value = element(coalescelist(azurerm_virtual_network_gateway.this.*.id, [""]), 0)
}
