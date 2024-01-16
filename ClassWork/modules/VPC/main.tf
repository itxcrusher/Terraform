resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/22"
}
resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.0.0/22"
}