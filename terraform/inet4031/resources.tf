# Creation of NFS server
resource "aws_instance" "nfs_server" {
   count = 1
   ami = "${var.ubuntu_ami}"
   instance_type = "t2.micro"
   key_name = "inet4031"
   subnet_id = "${aws_subnet.4031subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.4031sg.id}"]
   associate_public_ip_address = true
   source_dest_check = false

   tags {
    Name = "nfs_server"
  }
}

# Creation of NFS clients
resource "aws_instance" "nfs_client" {
   count = 5
   ami = "${var.ubuntu_ami}"
   instance_type = "t2.micro"
   key_name = "inet4031"
   subnet_id = "${aws_subnet.4031subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.4031sg.id}"]
   associate_public_ip_address = true
   source_dest_check = false

   tags {
    Name = "nfs_client_${count.index}"
  }
}
