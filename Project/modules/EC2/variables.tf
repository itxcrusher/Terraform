variable "ami" {
  description = "AMI ID for the EC2 instance"
  default = "ami-0c7217cdde317cfec"
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for the EC2 instance"
  default = "key"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  default = "Terraform-Project-Instance"
}

variable "vpc_id" {
  type = string
  description = "Name tag for the VPC"
}

variable "subnet_id" {
  type = string
  description = "Name tag for the Subnet"
}
variable "con_type"{
  type = string
  default = "ssh"
}
variable "con_user" {
  type = string
  default = "ubuntu"
}