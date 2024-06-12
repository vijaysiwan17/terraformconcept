resource "azurerm_storage_account" "mystorage" {
  name                = "stvijay9964"
  resource_group_name = azurerm_resource_group.myrg.name

  location                 = azurerm_resource_group.myrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"


  tags = {
    environment = "staging"
    Name        = "staging"
  }
}
/*resource "azurerm_storage_share_file" "myshare" {
  name             = "fileshare1"
  storage_share_id = azurerm_storage_share.myshare.id
}*/
resource "azurerm_storage_share" "myshare" {
  name                 = "fileshare1"
  storage_account_name = azurerm_storage_account.mystorage.name
  quota                = 50

}






resource "azurerm_resource_group" "myrg" {
  name     = "myrg"
  location = "eastus"

  tags = {
    environment = "staging"
    Name        = "staging"
  }
}

