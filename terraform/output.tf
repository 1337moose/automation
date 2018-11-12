output "public_prod_ips" {
  value = ["${aws_instance.public_prod.*.public_ip}"]
}

output "public_failover_public_ips" {
  value = ["${aws_instance.public_failover.*.public_ip}"]
}

output "private_prod_public_ips" {
  value = ["${aws_instance.private_prod.*.public_ip}"]
}

output "private_test_public_ips" {
  value = ["${aws_instance.public_prod.*.public_ip}"]
}
