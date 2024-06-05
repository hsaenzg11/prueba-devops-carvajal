#VPC
resource "aws_vpc" "principal" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

#Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.principal.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

#Route Table para subnets públicas
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.principal.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

# subnets públicas
resource "aws_subnet" "public" {
  count = 3

  vpc_id            = aws_vpc.principal.id
  cidr_block        = element(var.public_subnets_cidr, count.index)
  map_public_ip_on_launch = true
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-public-subnet-${count.index + 1}"
  }
}

# Asigna subnets públicas a la route table pública
resource "aws_route_table_association" "public" {
  count = 3

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

#Route Table para subnets privadas
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.principal.id

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

#subnets privadas
resource "aws_subnet" "private" {
  count = 3

  vpc_id     = aws_vpc.principal.id
  cidr_block = element(var.private_subnets_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
  }
}

# Asigna subnets privadas a la route table privada
resource "aws_route_table_association" "private" {
  count = 3

  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}
