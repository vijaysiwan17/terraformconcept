variable "resource_group_name" {
  type = string


}
variable "resource_group_location" {
  type = string

}
variable "virtual_network_name" {
  type = string

}
variable "virtual_network_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]

}
variable "admin_username" {
  type      = string
  sensitive = true


}
variable "admin_password" {
  type      = string
  sensitive = true

}




variable "public_subnet1_name" {
  type    = string
  default = "public-subnet1"

}
variable "public_subnet1_address_prefixes" {
  type = list(string)

}



variable "public_subnet2_address_prefixes" {
  type = list(string)

}
variable "public_subnet2_name" {
  type    = string
  default = "public-subnet2"

}

#ggggggggggggggg
variable "private_subnet1_address_prefixes" {
  type = list(string)

}
variable "private_subnet1_name" {
  type    = string
  default = "private-subnet1"

}
variable "private_subnet2_address_prefixes" {
  type = list(string)

}
variable "private_subnet2_name" {
  type    = string
  default = "private-subnet2"

}