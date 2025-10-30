resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-instancia"
  }
}

resource "aws_security_group" "allow_http_and_ssh" {
  name = "allow_http_and_ssh"
  vpc_id = aws_vpc.vpc.id

  ingress = {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  
  ingress = {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  ingress = {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  ingress = {
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  ingress = {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  egress = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks =  ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-instance"
  }
}

resource "aws_internet_gateway" "router" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "router-instance"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.router.id
  }

  tags = {
    Name = "route-table-instance"
  }
}

resource "aws_route_table_association" "route_table_association" {
  route_table_id = aws_route_table.route_table.id
  subnet_id = aws_subnet.public_subnet.id
}