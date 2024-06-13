resource "azurerm_resource_group" "myrg" {
  name     = var.resource_group_name
  location = var.resource_group_location


}
resource "azurerm_virtual_network" "myvnet" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space       = var.virtual_network_address_space


}
resource "azurerm_subnet" "public_subnet1" {
  name                 = var.public_subnet1_name
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.public_subnet1_address_prefixes
}
resource "azurerm_subnet" "public_subnet2" {
  name                 = var.public_subnet2_name
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.public_subnet2_address_prefixes
}
resource "azurerm_subnet" "private_subnet1" {
  name                 = var.private_subnet1_name
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.private_subnet1_address_prefixes
}

resource "azurerm_subnet" "private_subnet2" {
  name                 = var.private_subnet2_name
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.private_subnet2_address_prefixes
}

