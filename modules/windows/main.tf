# Availability Set - Windows
resource "azurerm_availability_set" "avs_windows" {
  name                = var.windows_avs
  resource_group_name = var.rg1
  location            = var.location
}

# Public IP - Windows
resource "azurerm_public_ip" "pip_windows" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.rg1
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = local.common_tags
}

# Network Interface - Windows
resource "azurerm_network_interface" "nic_windows" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  resource_group_name = var.rg1
  location            = var.location
  ip_configuration {
    name                          = "${each.key}-nic-ip"
    public_ip_address_id          = azurerm_public_ip.pip_windows[each.key].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
  depends_on = [
    azurerm_public_ip.pip_windows
  ]
  tags = local.common_tags
}

# Virtual Machine - Windows
resource "azurerm_windows_virtual_machine" "vm_windows" {
  for_each              = var.windows_name
  name                  = each.key
  computer_name         = each.key
  resource_group_name   = var.rg1
  location              = var.location
  size                  = each.value
  admin_username        = var.windows_admin_user.admin_username
  admin_password        = var.windows_admin_user.admin_password
  network_interface_ids = [azurerm_network_interface.nic_windows[each.key].id]

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.windows_os_disk.caching
    storage_account_type = var.windows_os_disk.storage_account_type
    disk_size_gb         = var.windows_os_disk.disk_size_gb
  }

  source_image_reference {
    publisher = var.windows_os_info.publisher
    offer     = var.windows_os_info.offer
    sku       = var.windows_os_info.sku
    version   = var.windows_os_info.version
  }

  tags = local.common_tags
}