# Define the vpc
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "inet4007vpc"
  }
}

# Define public_prod subnet
resource "aws_subnet" "public_prod_subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_prod_subnet_cidr}"
  availability_zone = "${var.aws_availability_zone}"

  tags{
    Name = "Public Prod Subnet"
  }
}

#Define public_failover subnet
resource "aws_subnet" "public_failover_subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_failover_subnet_cidr}"
  availability_zone = "${var.aws_availability_zone}"

  tags {
    Name = "Public Failover Subnet"
  }
}


#Define private_prod subnet
resource "aws_subnet" "private_prod_subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_prod_subnet_cidr}"
  availability_zone = "${var.aws_availability_zone}"

  tags {
    Name = "Private Prod Subnet"
  }
}

#Define private_prod subnet
resource "aws_subnet" "private_test_subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_test_subnet_cidr}"
  availability_zone = "${var.aws_availability_zone}"

  tags {
    Name = "Private Test Subnet"
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
resource "aws_route_table_association" "public_prod-rt" {
  subnet_id = "${aws_subnet.public_prod_subnet.id}"
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

# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name = "inet4007"
  public_key = "${file("${var.key_path}")}"
}

# Define webserver inside the public subnet
resource "aws_instance" "public_prod_1" {
   ami  = "${var.ubuntu_ami}"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.public_prod_subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.4007sg.id}"]
   associate_public_ip_address = true
   source_dest_check = false

  tags {
    Name = "public_prod"
  }
}
