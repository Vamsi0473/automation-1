variable "linux_name" {
  type    = map(string)
  default = {}
}

variable "linux_size" {
  default = "Standard_B1s"
}

variable "linux_username" {
  default = "auto"
}

variable "linux_admin_ssh_key" {
  type = map(string)
  default = {
    username   = "auto"
    public_key = "/home/auto/.ssh/id_rsa.pub"
  }
}

variable "linux_os_disk" {
  type = map(string)
  default = {
    storage_account_type = "Premium_LRS"
    disk_size_gb         = "32"
    caching              = "ReadWrite"
  }
}

variable "linux_os_info" {
  type = map(string)
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "19.04"
    version   = "latest"
  }
}

variable "linux_avs" {
  default = "linux_avs"
}

variable "linux_nb_count" {}

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