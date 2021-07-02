output "VM-Linux-Hostname" {
  value = [values(azurerm_linux_virtual_machine.vm_linux)[*].name]
}

output "PrivateIP-Linux" {
  value = [values(azurerm_linux_virtual_machine.vm_linux)[*].private_ip_address]
}

output "PublicIP-Linux" {
  value = [values(azurerm_linux_virtual_machine.vm_linux)[*].public_ip_address]
}