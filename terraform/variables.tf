variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-2"
}

variable "aws_availability_zone" {
  default = "us-east-2c"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "172.16.0.0/16"
}

variable "public_prod_subnet_cidr" {
  description = "CIDR for public_prod subnet"
  default = "172.16.1.0/24"
}

variable "public_failover_subnet_cidr" {
  description = "CIDR for the public_failover subnet"
  default = "172.16.2.0/24"
}

variable "private_prod_subnet_cidr" {
  description = "CIDR for the private_prod subnet"
  default = "172.16.3.0/24"
}

variable "private_test_subnet_cidr" {
  description = "CIDR for the private_test subnet"
  default = "172.16.4.0/24"
}
variable "ubuntu_ami" {
  description = "Amazon Linux AMI"
  default = "ami-0782e9ee97725263d"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/home/moose/Documents/School/inet4007/inet4007.pem"
}
