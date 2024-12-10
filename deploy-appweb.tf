// Simple Linux VM deployment
provider "vsphere" {
  user           = "administrator@vsphere.local"
  password       = "Root@1234"
  vsphere_server = "192.168.30.10"

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

module "app-web" {
  source       = "Terraform-VMWare-Modules/vm/vsphere"
  version      = "3.8.0"
  vmtemp       = "rockylinux810"
  vmfolder     = "Automation/Subfolder"
  instances    = 2
  vmname       = "web-app2"
  vmrp         = "devservice/Resources"
  linked_clone = "true"
  network = {
    "cpom-3508" = ["172.30.50.153", "172.30.50.151"]
  }
  #power_state     = "off"
  dns_server_list = ["192.168.30.101", "8.8.8.8"]
  vmgateway       = "172.30.50.254"
  dc              = "PDLabDC"
  datastore       = "Lab580nfs"
  #  shutdown_wait_timeout = 3
  #  force_power_off  = "true"
}
