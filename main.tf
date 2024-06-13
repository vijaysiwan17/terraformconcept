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
resource "azurerm_availability_set" "myavset" {
  name                         = "myavset"
  resource_group_name          = azurerm_resource_group.myrg.name
  location                     = azurerm_resource_group.myrg.location
  platform_update_domain_count = 3
  platform_fault_domain_count  = 3
  managed                      = true
}

resource "azurerm_linux_virtual_machine" "myvm1" {
  name                            = "myvm1"
  resource_group_name             = azurerm_resource_group.myrg.name
  location                        = azurerm_resource_group.myrg.location
  size                            = "Standard_B1s"
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.vm1nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  availability_set_id = azurerm_availability_set.myavset.id
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
resource "azurerm_network_interface" "vm1nic" {
  name                = "vm1nic"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "vm1nic"
    subnet_id                     = azurerm_subnet.public_subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}
#second vm
resource "azurerm_linux_virtual_machine" "myvm2" {
  name                            = "myvm2"
  resource_group_name             = azurerm_resource_group.myrg.name
  location                        = azurerm_resource_group.myrg.location
  size                            = "Standard_B1s"
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.vm2nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  availability_set_id = azurerm_availability_set.myavset.id
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
resource "azurerm_network_interface" "vm2nic" {
  name                = "vm2nic"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "vm2nic"
    subnet_id                     = azurerm_subnet.public_subnet2.id
    private_ip_address_allocation = "Dynamic"
  }
}

# third vm
resource "azurerm_linux_virtual_machine" "myvm3" {
  name                            = "myvm3"
  resource_group_name             = azurerm_resource_group.myrg.name
  location                        = azurerm_resource_group.myrg.location
  size                            = "Standard_B1s"
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.vm3nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  availability_set_id = azurerm_availability_set.myavset.id
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
resource "azurerm_network_interface" "vm3nic" {
  name                = "vm3nic"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "vm3nic"
    subnet_id                     = azurerm_subnet.private_subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}



