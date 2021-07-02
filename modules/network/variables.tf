variable "vnet1" {
  default = "lab02-vnet"
}

variable "subnet1" {
  default = "lab02-subnet1"
}

variable "subnet2" {
  default = "lab02-subnet2"
}

variable "subnet1_space" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}

variable "subnet2_space" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "nsg1" {
  default = "lab02-nsg1"
}

variable "nsg2" {
  default = "lab02-nsg2"
}

variable "rg1" {}

variable "location" {
  default = "canadacentral"
}

locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "vamsi.universe@gmail.com"
    Environment  = "Lab"
  }
}