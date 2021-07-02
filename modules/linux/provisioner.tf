resource "null_resource" "provisioner_linux" {
  for_each = var.linux_name
  depends_on = [
    azurerm_linux_virtual_machine.vm_linux
  ]

  provisioner "local-exec" {
    command = "ls /etc/hostname"

    connection {
      type        = "ssh"
      host        = var.linux_name[each.key]
      user        = var.linux_admin_ssh_key.username
      private_key = file(var.linux_admin_ssh_key.public_key)
    }
  }
}