# Resource Group
output "ResourceGroup-Name" {
  value = module.resource_group.ResourceGroup.name
}


# Network
output "VirtualNetwork-Name" {
  value = module.network.VirtualNetwork.name
}

output "VirtualNetwork-AddressSpace" {
  value = module.network.VirtualNetwork.address_space
}

output "Subnet1-Name" {
  value = module.network.Subnet1.name
}

output "Subnet1-AddressSpace" {
  value = module.network.Subnet1.address_prefix
}

output "Subnet2-Name" {
  value = module.network.Subnet2.name
}

output "Subnet2-AddressSpace" {
  value = module.network.Subnet2.address_prefix
}


# Linux
output "VM-Linux-Hostnames" {
  value = module.linux.VM-Linux-Hostname
}

output "PrivateIPs-Linux" {
  value = module.linux.PrivateIP-Linux
}

output "PublicIPs-Linux" {
  value = module.linux.PublicIP-Linux
}


# Windows
output "VM-Windows-Hostname" {
  value = module.windows.VM-Windows-Hostname
}

output "PrivateIP-Windows" {
  value = module.windows.PrivateIP-Windows
}

output "PublicIP-Windows" {
  value = module.windows.PublicIP-Windows
}