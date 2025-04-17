variable "tfusername" {
    type = string
}
variable "tfpassword" {
  type = string
}

provider "vsphere" {
  user           = var.tfusername
  password       = var.tfpassword
  vsphere_server = "192.168.30.10"
  allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "mysvc1-vm1" {
  name             = "mysvc1-vm1"
  resource_pool_id = data.vsphere_compute_cluster.svcluster1.resource_pool_id
  datastore_id     = data.vsphere_datastore.iscsi-ds.id
  num_cpus         = 1
  memory           = 1024
  guest_id         = data.vsphere_virtual_machine.rockylinux810.guest_id
  firmware         = data.vsphere_virtual_machine.rockylinux810.firmware
  folder           = "Automation/Subfolder"
  network_interface {
    network_id   = data.vsphere_network.cpom-3507.id
    adapter_type = "vmxnet3"
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.rockylinux810.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.rockylinux810.id
    linked_clone = "true"
    customize {
     ipv4_gateway = "172.30.50.254"
     dns_server_list = ["8.8.8.8"]
     linux_options {
      host_name = "mysvc1-vm1"
      domain = "local"
     }
     network_interface {
     ipv4_address = "172.30.50.161"
     ipv4_netmask = 24
      }
    }
  }
}

resource "vsphere_virtual_machine" "mysvc1-vm3" {
  name             = "mysvc1-vm3"
  resource_pool_id = data.vsphere_compute_cluster.svcluster1.resource_pool_id
  datastore_id     = data.vsphere_datastore.iscsi-ds.id
  num_cpus         = 2
  memory           = 2048
  guest_id         = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.guest_id
  firmware         = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.firmware
  folder           = "Automation/Subfolder"
  network_interface {
    network_id   = data.vsphere_network.cpom-3508.id
    adapter_type = "vmxnet3"
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.id
    linked_clone = "true"
    customize {
     ipv4_gateway = "192.168.109.254"
     dns_server_list = ["8.8.8.8"]
     linux_options {
      host_name = "mysvc1-vm3"
      domain = "local"
     }
     network_interface {
     ipv4_address = "192.168.109.163"
     ipv4_netmask = 24
      }
    }
  }
}

resource "vsphere_virtual_machine" "mysvc1-vm2" {
  name             = "mysvc1-vm2"
  resource_pool_id = data.vsphere_compute_cluster.svcluster1.resource_pool_id
  datastore_id     = data.vsphere_datastore.iscsi-ds.id
  num_cpus         = 1
  memory           = 1024
  guest_id         = data.vsphere_virtual_machine.rockylinux810.guest_id
  firmware         = data.vsphere_virtual_machine.rockylinux810.firmware
  folder           = "Automation/Subfolder"
  network_interface {
    network_id   = data.vsphere_network.cpom-3507.id
    adapter_type = "vmxnet3"
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.rockylinux810.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }
  disk {
    label            = "disk1"
    size             = 10
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 1
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.rockylinux810.id
    linked_clone = "true"
    customize {
     ipv4_gateway = "172.30.50.254"
     dns_server_list = ["8.8.8.8"]
     linux_options {
      host_name = "mysvc1-vm2"
      domain = "local"
     }
     network_interface {
     ipv4_address = "172.30.50.162"
     ipv4_netmask = 24
      }
    }
  }
}

resource "vsphere_virtual_machine" "mysvc1-vm4" {
  name             = "mysvc1-vm4"
  resource_pool_id = data.vsphere_compute_cluster.svcluster1.resource_pool_id
  datastore_id     = data.vsphere_datastore.iscsi-ds.id
  num_cpus         = 1
  memory           = 1024
  guest_id         = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.guest_id
  firmware         = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.firmware
  folder           = "Automation/Subfolder"
  network_interface {
    network_id   = data.vsphere_network.cpom-3508.id
    adapter_type = "vmxnet3"
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.id
    linked_clone = "true"
    customize {
     ipv4_gateway = "192.168.109.254"
     dns_server_list = ["8.8.8.8"]
     linux_options {
      host_name = "mysvc1-vm4"
      domain = "local"
     }
     network_interface {
     ipv4_address = "192.168.109.164"
     ipv4_netmask = 24
      }
    }
  }
}

resource "vsphere_virtual_machine" "mysvc1-vm5" {
  name             = "mysvc1-vm5"
  resource_pool_id = data.vsphere_compute_cluster.svcluster1.resource_pool_id
  datastore_id     = data.vsphere_datastore.iscsi-ds.id
  num_cpus         = 1
  memory           = 1024
  guest_id         = data.vsphere_virtual_machine.rockylinux810.guest_id
  firmware         = data.vsphere_virtual_machine.rockylinux810.firmware
  folder           = "Automation/Subfolder"
  network_interface {
    network_id   = data.vsphere_network.cpom-3507.id
    adapter_type = "vmxnet3"
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.rockylinux810.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.rockylinux810.id
    linked_clone = "true"
    customize {
     ipv4_gateway = "172.30.50.254"
     dns_server_list = ["8.8.8.8"]
     linux_options {
      host_name = "mysvc1-vm5"
      domain = "local"
     }
     network_interface {
     ipv4_address = "172.30.50.165"
     ipv4_netmask = 24
      }
    }
  }
}

resource "vsphere_virtual_machine" "mysvc1-vm6" {
  name             = "mysvc1-vm6"
  resource_pool_id = data.vsphere_compute_cluster.svcluster1.resource_pool_id
  datastore_id     = data.vsphere_datastore.iscsi-ds.id
  num_cpus         = 1
  memory           = 1024
  guest_id         = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.guest_id
  firmware         = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.firmware
  folder           = "Automation/Subfolder"
  network_interface {
    network_id   = data.vsphere_network.cpom-3508.id
    adapter_type = "vmxnet3"
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.ubuntu2204-template-upgrade.id
    linked_clone = "true"
    customize {
     ipv4_gateway = "192.168.109.254"
     dns_server_list = ["8.8.8.8"]
     linux_options {
      host_name = "mysvc1-vm6"
      domain = "local"
     }
     network_interface {
     ipv4_address = "192.168.109.166"
     ipv4_netmask = 24
      }
    }
  }
}

data "vsphere_datacenter" "dc" {
  name = "PDLabDC"
}

data "vsphere_compute_cluster" "svcluster1" {
  name          = "devservice"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "iscsi-ds" {
  name          = "iscsi-ds"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "cpom-3508" {
  name          = "cpom-3508"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "cpom-3507" {
  name          = "cpom-3507"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "ubuntu2204-template-upgrade" {
  name          = "ubuntu2204-template-upgrade"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "rockylinux810" {
  name          = "rockylinux810"
  datacenter_id = data.vsphere_datacenter.dc.id
}
