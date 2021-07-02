variable "windows_name" {
  type    = map(string)
  default = {}
}

variable "windows_avs" {
  default = "windows_avs"
}

variable "windows_os_disk" {
  type = map(string)
  default = {
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = "127"
    caching              = "ReadWrite"
  }
}

variable "windows_os_info" {
  type = map(string)
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

variable "windows_admin_user" {
  type = map(string)
  default = {
    admin_username = "auto"
    admin_password = "P@$$w0rd1234!"
  }
}

variable "windows_nb_count" {}

variable "rg1" {}

variable "location" {
  default = "canadacentral"
}

variable "subnet_id" {}

locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "vamsi.universe@gmail.com"
    Environment  = "Lab"
  }
}