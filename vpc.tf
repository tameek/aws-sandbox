resource "aws_vpc" "poc-vpc" {
  cidr_block           = var.cidrs
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
}

resource "aws_subnet" "poc-private-subnet" {
  vpc_id            = aws_vpc.poc-vpc.id
  cidr_block        = "$[var.private_subnet]"
  availability_zone = var.df_az

  tags = {
    Name = "POC Private Subnet"
  }
}

resource "aws_route_table" "poc-private-route-table" {
  vpc_id = aws_vpc.poc-vpc.id

  tags = {
    Name = "POC Private Route Table"
  }
}

resource "aws_route_table_association" "poc-private-route-table-assoc" {
  subnet_id      = aws_subnet.poc-private-subnet.id
  route_table_id = aws_route_table.poc-private-route-table.id
}

resource "aws_internet_gateway" "poc-igw" {
  vpc_id = aws_vpc.poc-vpc.id
  tags = {
    Name = "POC Public Internet Gateway"
  }
}

resource "aws_subnet" "poc-public-subnet" {
  vpc_id            = aws_vpc.poc-vpc.id
  cidr_block        = "$[var.public_subnet]"
  availability_zone = var.df_az

  tags = {
    Name = "POC Public Subnet"
  }
}

resource "aws_route_table" "poc-public-route-table" {
  vpc_id = aws_vpc.poc-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.poc-igw.id
  }

  tags = {
    Name = "{POC Public Route Table"
  }
}

resource "aws_route_table_association" "poc-public-route-table-assoc" {
  subnet_id      = aws_subnet.poc-public-subnet.id
  route_table_id = aws_route_table.poc-public-route-table.id
}
