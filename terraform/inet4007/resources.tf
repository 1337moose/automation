# Define webserver inside the public subnet
resource "aws_instance" "public_prod" {
   count = 2
   ami = "${var.ubuntu_ami}"
   instance_type = "t2.micro"
   key_name = "inet4007"
   subnet_id = "${aws_subnet.public_subnet.0.id}"
   vpc_security_group_ids = ["${aws_security_group.4007sg.id}"]
   associate_public_ip_address = true
   source_dest_check = false

   tags {
    Name = "public_prod_${count.index}"
  }
}

  resource "aws_instance" "public_failover" {
     count = 2
     ami = "${var.ubuntu_ami}"
     instance_type = "t2.micro"
     key_name = "inet4007"
     subnet_id = "${aws_subnet.public_subnet.1.id}"
     vpc_security_group_ids = ["${aws_security_group.4007sg.id}"]
     associate_public_ip_address = true
     source_dest_check = false

     tags {
      Name = "public_failover_${count.index}"
    }
  }

    resource "aws_instance" "private_prod" {
       count = 2
       ami = "${var.ubuntu_ami}"
       instance_type = "t2.micro"
       key_name = "inet4007"
       subnet_id = "${aws_subnet.private_subnet.0.id}"
       vpc_security_group_ids = ["${aws_security_group.4007sg.id}"]
       associate_public_ip_address = true
       source_dest_check = false

       tags {
        Name = "private_prod_${count.index}"
      }
}

resource "aws_instance" "private_test" {
   count = 2
   ami = "${var.ubuntu_ami}"
   instance_type = "t2.micro"
   key_name = "inet4007"
   subnet_id = "${aws_subnet.private_subnet.1.id}"
   vpc_security_group_ids = ["${aws_security_group.4007sg.id}"]
   associate_public_ip_address = true
   source_dest_check = false

   tags {
    Name = "private_test_${count.index}"
  }
}
