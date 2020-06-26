
build {
  name = "ubuntu"
  description = <<EOF
This build creates ubuntu images for ubuntu versions :
* 16.04
* 18.04 
For the following builers :
* virtualbox-iso
EOF

  source "source.virtualbox-iso.base-ubuntu-amd64" {
    iso_url               = local.iso_url_ubuntu_1604
    iso_checksum          = local.iso_checksum_ubuntu_1604
    output_directory      = "ubuntu_1604"
    boot_command          = local.ubuntu_1604_boot_command
    hard_drive_interface  = "sata"
  }

  // source "source.virtualbox-iso.base-ubuntu-amd64" {
  //   iso_url          = local.iso_url_ubuntu_1804
  //   iso_checksum     = local.iso_checksum_ubuntu_1804
  //   output_directory = "ubuntu_1804"
  // }

  provisioner "shell" {
    scripts = fileset(".", "etc/scripts/*.sh")

  // /../_common/minimize.sh"
  }
}