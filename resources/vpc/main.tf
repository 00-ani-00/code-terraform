provider "aws" {

 region = eu-west-1
profile = "ani"

}

resource "aws_vpc" "new1" {
    cidr_block           = var.cidr_vpc
    enable_dns_hostnames = true
    
    tags {
        Name =var.vpc_tags
        }
}

resource "aws_subnet" "suubnet_1" {
    vpc_id     = aws_vpc.new1.id
    cidr_block = var.cidr_public
    availability_zone="eu-west-1a"
    map_public_ip_on_launch = true
    tags{
        name= var.public_subnet_tags
        }
}

resource "aws_subnet" "subnet_2" {
    vpc_id      =  aws_vpc.new1.id
    cidr_block   =    var.cidr_private
    availability_zone="eu-west-1b"
    tags{
        name= var.private_subnet_tags
        }

}

resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.new1.id
    tags={
        Name="igw"
}
}

resource "aws_route" "name" {
    route_table_id         = aws_vpc.new1.main_route_table_id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id              = aws_internet_gateway.IGW.id
  
} 