# Define the vpc
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "inet4007vpc"
  }
}

# Define public_prod subnet
resource "aws_subnet" "public_subnet" {
  count = "${length(var.public_subnet_cidr)}"

  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr[count.index]}"
  availability_zone = "${var.aws_availability_zone}"

  tags{
    Name = "Public Subnet"
  }
}



#Define private_prod subnet
resource "aws_subnet" "private_subnet" {
  count = "${length(var.private_subnet_cidr)}"

  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr[count.index]}"
  availability_zone = "${var.aws_availability_zone}"

  tags {
    Name = "Private Subnet"
  }
}


# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "VPC IGW"
  }
}

# Define the route table
resource "aws_route_table" "route_table" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Routing Table"
  }
}

# Assign the route table to the public Subnet
# Need to add all subnets to this route table?
resource "aws_route_table_association" "public_rt" {
  count = "${length(var.public_subnet_cidr)}"

  subnet_id = "${element(aws_subnet.public_subnet.*.id,count.index)}"
  route_table_id = "${aws_route_table.route_table.id}"
}

# Assign the route table to the public Subnet
# Need to add all subnets to this route table?
resource "aws_route_table_association" "private_rt" {
  count = "${length(var.private_subnet_cidr)}"

  subnet_id = "${element(aws_subnet.private_subnet.*.id,count.index)}"
  route_table_id = "${aws_route_table.route_table.id}"
}

# Define the security group for public subnet
resource "aws_security_group" "4007sg" {
  name = "Default 4007 Security Group"
  description = "Allow incoming SSH access"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  vpc_id="${aws_vpc.default.id}" #Can I put this higher?

  tags {
    Name = "Default Security Group"
  }
}
