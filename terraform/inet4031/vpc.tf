# Define the vpc
resource "aws_vpc" "inet4031vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "inet4031vpc"
  }
}

# Define the subnet
resource "aws_subnet" "4031subnet" {
  vpc_id = "${aws_vpc.inet4031vpc.id}"
  cidr_block = "${var.4031subnet_cidr}"
  availability_zone = "${var.aws_availability_zone}"

  tags{
    Name = "Default 4031 Subnet"
  }
}


# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.inet4031vpc.id}"

  tags {
    Name = "VPC IGW"
  }
}

# Define the route table
resource "aws_route_table" "route_table" {
  vpc_id = "${aws_vpc.inet4031vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Routing Table"
  }
}

# Assign the route table to the subnet
resource "aws_route_table_association" "4031_rt" {
  subnet_id = "${aws_subnet.4031subnet.id}"
  route_table_id = "${aws_route_table.route_table.id}"
}


# Define the security group for public subnet
resource "aws_security_group" "4031sg" {
  name = "default_4031sg"
  description = "Allow incoming SSH access"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  ingress {
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
    cidr_blocks = ["${var.4031subnet_cidr}"]
  }

  ingress {
    from_port = 111
    to_port = 111
    protocol = "udp"
    cidr_blocks = ["${var.4031subnet_cidr}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  vpc_id="${aws_vpc.inet4031vpc.id}"

  tags {
    Name = "Default Security Group"
  }
}
