#vpc

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  
  tags = {
    Name = var.tag
  }

}


resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 2, 0)
  availability_zone = var.region

}


# Internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devops.id

}


resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.devops.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}