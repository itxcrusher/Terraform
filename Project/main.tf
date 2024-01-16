module "VPC" {
    source = "./modules/VPC"
}

module "Instance"{
    source = "./modules/EC2"
    vpc_id = module.VPC.terraform_vpc_id
    subnet_id = module.VPC.terraform_subnet_id
}