# Availability Set - Linux
resource "azurerm_availability_set" "avs_linux" {
  name                = var.linux_avs
  resource_group_name = var.rg1
  location            = var.location
}

# Public IP - Linux
resource "azurerm_public_ip" "pip_linux" {
  for_each            = var.linux_name
  name                = "${each.key}-pip"
  resource_group_name = var.rg1
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = local.common_tags
}

# Network Interface - Linux
resource "azurerm_network_interface" "nic_linux" {
  for_each            = var.linux_name
  name                = "${each.key}-nic"
  resource_group_name = var.rg1
  location            = var.location
  ip_configuration {
    name                          = "${each.key}-nic-ip"
    public_ip_address_id          = azurerm_public_ip.pip_linux[each.key].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
  depends_on = [
    azurerm_public_ip.pip_linux
  ]
  tags = local.common_tags
}

# Virtual Machine - Linux
resource "azurerm_linux_virtual_machine" "vm_linux" {
  for_each              = var.linux_name
  name                  = each.key
  computer_name         = each.key
  size                  = each.value
  resource_group_name   = var.rg1
  location              = var.location
  admin_username        = var.linux_username
  network_interface_ids = [azurerm_network_interface.nic_linux[each.key].id]

  admin_ssh_key {
    username   = var.linux_admin_ssh_key.username
    public_key = file(var.linux_admin_ssh_key.public_key)
  }

  os_disk {
    caching              = var.linux_os_disk.caching
    storage_account_type = var.linux_os_disk.storage_account_type
    disk_size_gb         = var.linux_os_disk.disk_size_gb
  }

  source_image_reference {
    publisher = var.linux_os_info.publisher
    offer     = var.linux_os_info.offer
    sku       = var.linux_os_info.sku
    version   = var.linux_os_info.version
  }

  tags = local.common_tags
}