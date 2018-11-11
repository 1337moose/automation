# Define webserver inside the public subnet
resource "aws_instance" "public_prod_1" {
   ami = "${var.ubuntu_ami}"
   instance_type = "t2.micro"
   key_name = "inet4007"
   subnet_id = "${aws_subnet.public_subnet.0.id}"
   vpc_security_group_ids = ["${aws_security_group.4007sg.id}"]
   associate_public_ip_address = true
   source_dest_check = false

   tags {
    Name = "public_prod"
  }
}
