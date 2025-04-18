module "resource_group" {
  source   = "../azure/azurerm_resource_group"
  name     = "devops2-abdulrzzaq"
  location = var.location
}

module "virtual_network" {
  source              = "../azure/azurerm_virtual_network"
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "subnet" {
  source               = "../azure/azurerm_subnet"
  name                 = "my-subnet"
  address_prefixes     = ["10.0.1.0/24"]
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.virtual_network.virtual_network_name
}

module "nsg" {
  source              = "../azure/azurerm_network_security_group"
  name                = "my-nsg"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "nsg_rule" {
  source                      = "../azure/azurerm_network_security_rule"
  name                        = "allow-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  destination_port_range      = "22"
  resource_group_name         = module.resource_group.resource_group_name
  network_security_group_name = module.nsg.nsg_name
}

module "public_ip_backend" {
  source              = "../azure/azurerm_public_ip"
  name                = "backend-ip"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "public_ip_frontend" {
  source              = "../azure/azurerm_public_ip"
  name                = "frontend-ip"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "nic_backend" {
  source              = "../azure/azurerm_network_interface"
  name                = "backend-nic"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.subnet.subnet_id
  public_ip_id        = module.public_ip_backend.public_ip_id
  nsg_id              = module.nsg.nsg_id
}

module "nic_frontend" {
  source              = "../azure/azurerm_network_interface"
  name                = "frontend-nic"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.subnet.subnet_id
  public_ip_id        = module.public_ip_frontend.public_ip_id
  nsg_id              = module.nsg.nsg_id
}

module "vm_backend" {
  source              = "../azure/azurerm_linux_virtual_machine"
  name                = "backend-vm"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  nic_id              = module.nic_backend.nic_id
  public_key_path     = "C:/Users/a-0_o/.ssh/id_rsa.pub"
  custom_data = base64encode(<<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get upgrade -y
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update -y
    apt-get install -y docker-ce
    usermod -aG docker azureuser
    systemctl enable docker
    systemctl start docker
  EOT
  )
}

module "vm_frontend" {
  source              = "../azure/azurerm_linux_virtual_machine"
  name                = "frontend-vm"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  nic_id              = module.nic_frontend.nic_id
  public_key_path     = "C:/Users/a-0_o/.ssh/id_rsa.pub"
  custom_data = base64encode(<<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get upgrade -y
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update -y
    apt-get install -y docker-ce
    usermod -aG docker azureuser
    systemctl enable docker
    systemctl start docker
  EOT
  )
}

module "sql_database" {
  source              = "../azure/azurerm_mssql_database"
  server_name         = "devops2-sql-abdulrzzaq"
  database_name       = "my-db"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  admin_username      = "sqladminuser"
  admin_password      = "0599366939aA"
  sku_name            = "Basic"
}

module "sql_firewall_rule" {
  source              = "../azure/azurerm_mssql_firewall_rule"
  name                = "allow-all"
  server_id           = module.sql_database.sql_server_id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}
