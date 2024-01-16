output "terraform_vpc_id" {
  value = aws_vpc.terraform_vpc.id
}
output "terraform_subnet_id" {
    value = aws_subnet.terraform_subnet.id
}