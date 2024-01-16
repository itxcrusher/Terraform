output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

resource "null_resource" "ssh_ec2"{
    connection {
      type = "ssh"
      user = var.con_user
      private_key = file("key")
      host = "ip"
    }
    provisioner "remote-exec" {
      inline = [
        "command",
        "command1"
      ]
    }
    provisioner "file" {
      source = "path"
      destination = "path"
    }
}