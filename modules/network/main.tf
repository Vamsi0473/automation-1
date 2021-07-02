# Virtual Network
resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1
  resource_group_name = var.rg1
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

# Subnet
resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  resource_group_name  = var.rg1
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet1_space
}

# Security Group
resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1
  resource_group_name = var.rg1
  location            = var.location

  security_rule {
    name                       = "rule1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Subnet-SecurityGroup Assosication
resource "azurerm_subnet_network_security_group_association" "subnet1-nsg1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

# Subnet 2
resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2
  resource_group_name  = var.rg1
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet2_space
}

# Security Group 2
resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg2
  resource_group_name = var.rg1
  location            = var.location

  security_rule {
    name                       = "rule1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Subnet2-SecurityGroup2 Assosication
resource "azurerm_subnet_network_security_group_association" "subnet2-nsg2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}