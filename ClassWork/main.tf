module "VPC" {
  source = "./modules/VPC"
}
module "ec2_instance" {
  source        = "./modules/EC2"
  ami_id        = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name      = "key"
  instance_name = "terraform-instance"
  subnet_id = module.VPC.aws_subnet.subnet_id
}