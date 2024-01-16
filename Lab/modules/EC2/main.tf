resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2
              EOF

  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
}

resource "aws_security_group" "ec2_security_group" {
  name        = "Terraform_Lab_SG"
  description = "Allow inbound HTTP and SSH traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   
}