variable "ami_id" {
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
  default = "terraform-lab-instance"
}