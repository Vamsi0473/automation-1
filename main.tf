module "resource_group" {
  source = "./modules/resource_group"
  rg1    = "lab02-rg"
}

module "network" {
  source = "./modules/network"
  rg1    = "lab02-rg"
  depends_on = [
    module.resource_group
  ]
}

module "linux" {
  source         = "./modules/linux"
  linux_nb_count = 2
  linux_name = {
    "lab02s2-db1-u-vm1" = "Standard_B1s"
    "lab02s2-db1-u-vm2" = "Standard_B1s"
  }
  rg1       = "lab02-rg"
  subnet_id = module.network.Subnet1.id
  depends_on = [
    module.resource_group
  ]
}

module "windows" {
  source           = "./modules/windows"
  windows_nb_count = 1
  windows_name = {
    lab-web-w-vm1 = "Standard_B1s"
  }
  rg1       = "lab02-rg"
  subnet_id = module.network.Subnet1.id
  depends_on = [
    module.resource_group
  ]
}