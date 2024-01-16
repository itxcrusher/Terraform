variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "key_name" {
  description = "Key pair name for the EC2 instance"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
}

variable "subnet_id" {
  type = string
  description = "Name tag for the EC2 instance"
}

variable "con_user" {
  type = string
  default = "admin"
}