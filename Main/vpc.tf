resource "aws_vpc" "prod-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true" #give u an internal domain name
  enable_dns_hostnames = "true" #give u an internal host name
  instance_tenancy     = "default"
  tags = {
    Name = "prod-vpc"
  }
}

resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" #make the subnet public
  availability_zone       = "eu-west-1a"
  tags = {
    Name = "prod-subnet-public-1"
  }
}
