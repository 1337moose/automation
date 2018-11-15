# NFS Server IP outputs
output "nfs_server" {
  value = ["${aws_instance.nfs_server.public_ip}"
  , "${aws_instance.nfs_server.private_ip}"]
}


# NFS Clients IP outputs
output "nfs_client_0" {
  value = ["${aws_instance.nfs_client.0.public_ip}"
    ,"${aws_instance.nfs_client.0.private_ip}"]
}

# output "nfs_client_1" {
#   value = ["${aws_instance.nfs_client.1.public_ip}"
#     ,"${aws_instance.nfs_client.1.private_ip}"]
# }
#
# output "nfs_client_2" {
#   value = ["${aws_instance.nfs_client.2.public_ip}"
#     ,"${aws_instance.nfs_client.2.private_ip}"]
# }
# output "nfs_client_3" {
#   value = ["${aws_instance.nfs_client.3.public_ip}"
#     ,"${aws_instance.nfs_client.3.private_ip}"]
# }
# output "nfs_client_4" {
#   value = ["${aws_instance.nfs_client.4.public_ip}"
#     ,"${aws_instance.nfs_client.4.private_ip}"]
# }
