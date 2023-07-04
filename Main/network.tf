resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id
  tags = {
    Name = "prod-igw"
  }
}

resource "aws_route_table" "prod-public-rt" {
  vpc_id = aws_vpc.prod-vpc.id
  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //rt uses this IGW to reach the internet 
    gateway_id = aws_internet_gateway.prod-igw.id
  }
  tags = {
    Name = "prod-public-rt"
  }

}

resource "aws_route_table_association" "prod-rta-public-subnet-1" {
  subnet_id      = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.prod-public-rt.id
}

# resource "aws_key_pair" "my-key-pair" {
  # key_name   = "my-key-pair"
  # public_key = local.private_key_path
  # public_key = file("${path.module}/my-key-pair.pub")
# }

resource "aws_security_group" "ssh-allowed" {
  name = "nginx_access"
  vpc_id = aws_vpc.prod-vpc.id
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh-allowed"
  }
}
