resource "proxmox_vm_qemu" "srv_demo_1" {
  name = "srv-demo-1"
  desc = "Ubuntu Server 22.04"
  vmid = "101"
  target_node = "proxmox"

  onboot = true

  agent = 1

  clone = "ubuntu2204-cloudinit-template"

  bootdisk = "scsi0"

  bios = "seabios"

  full_clone = true
  
  os_type = "cloud-init"
  ipconfig0 = "ip=10.10.0.102/16,gw=10.10.0.1"
  nameserver = "1.1.1.1"
  ciuser = "root"
  cipassword = "testing123!"

  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048

  network {
    bridge = "vmbr1"
    model = "virtio"
  }

  disk {
    storage = "local-zfs"
    type = "scsi"
    size = "20684M"
  }


}