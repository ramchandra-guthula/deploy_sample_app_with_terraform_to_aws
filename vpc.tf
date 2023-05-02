

resource "aws_vpc" "myapp-vpc" {
  cidr_block           = var.ip_ranges[0]["vpc_range"]
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "myapp-public-subnet" {
  vpc_id     		  = aws_vpc.myapp-vpc.id
  cidr_block 		  = var.ip_ranges[0]["public_subnet_range"]
  map_public_ip_on_launch = true
  availability_zone	  = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}

resource "aws_subnet" "myapp-private-subnet" {
  vpc_id     		  = aws_vpc.myapp-vpc.id
  cidr_block 		  = var.ip_ranges[0]["private_subnet_range"]
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.vpc_name}-private-subnet"
  }
}

resource "aws_internet_gateway" "myapp-gw" {
  vpc_id = aws_vpc.myapp-vpc.id

  tags = {
    Name = "${var.vpc_name}-gw"
  }
}


resource "aws_route_table" "myapp-public-subnet-rt" {
  vpc_id = aws_vpc.myapp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-gw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-subnet-rt"
  }
}

resource "aws_route_table_association" "rt-association-public-subnet" {
  subnet_id      = aws_subnet.myapp-public-subnet.id
  route_table_id = aws_route_table.myapp-public-subnet-rt.id
}