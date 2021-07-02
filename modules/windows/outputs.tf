output "VM-Windows-Hostname" {
  value = [values(azurerm_windows_virtual_machine.vm_windows)[*].name]
}

output "PrivateIP-Windows" {
  value = [values(azurerm_windows_virtual_machine.vm_windows)[*].private_ip_address]
}

output "PublicIP-Windows" {
  value = [values(azurerm_windows_virtual_machine.vm_windows)[*].public_ip_address]
}