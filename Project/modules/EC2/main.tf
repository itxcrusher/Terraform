resource "aws_security_group" "terraform_security_group" {
  vpc_id = var.vpc_id
  name        = "Terraform_Project_SG"
  description = "Allow inbound HTTP and SSH traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "terraform_instance"{
    ami           = var.ami
    instance_type = var.instance_type
    key_name      = var.key_name
    subnet_id = var.subnet_id

    user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              EOF

    security_groups = [aws_security_group.terraform_security_group.id]

    tags = {
        Name = var.instance_name
    }
    provisioner "file" {
    source      = "${path.module}/app/Dockerfile"
    destination = "/home/ubuntu/Dockerfile"
  }

  provisioner "file" {
    source      = "${path.module}/app/app.py"
    destination = "/home/ubuntu/app.py"
  }

  provisioner "file" {
    source      = "${path.module}/app/requirements.txt"
    destination = "/home/ubuntu/requirements.txt"
  }
  connection {
    type        = var.con_type
    user        = var.con_user
    private_key = file("${path.module}/key.pem")
    host        = self.public_ip
    }
}

resource "null_resource" "docker_setup" {
  depends_on = [aws_instance.terraform_instance]

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y docker.io",
      "sudo docker build -t terraform-app .",
      "sudo docker run -p 80:80 -d terraform-app",
    ]
    connection {
    type        = var.con_type
    user        = var.con_user
    private_key = file("${path.module}/key.pem")
    host        = aws_instance.terraform_instance.public_ip
    }
  }
}