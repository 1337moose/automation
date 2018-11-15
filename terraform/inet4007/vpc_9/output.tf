output "public_prod_0_ips" {
  value = ["${aws_instance.public_prod.0.public_ip}"
  , "${aws_instance.public_prod.0.private_ip}"]
}
output "public_prod_1_ips" {
  value = ["${aws_instance.public_prod.1.public_ip}"
    ,"${aws_instance.public_prod.1.private_ip}"]
}
output "public_failover_0_ips" {
  value = ["${aws_instance.public_failover.0.public_ip}"
  ,"${aws_instance.public_failover.0.private_ip}"]
}

output "public_failover_1_ips" {
  value = ["${aws_instance.public_failover.1.public_ip}"
  ,"${aws_instance.public_failover.1.private_ip}"]
}

output "private_prod_0_ips" {
  value = ["${aws_instance.private_prod.0.public_ip}"
  ,"${aws_instance.private_prod.0.private_ip}"]
}
output "private_prod_1_ips" {
  value = ["${aws_instance.private_prod.1.public_ip}"
  ,"${aws_instance.private_prod.1.private_ip}"]
}

output "private_test_0_ips" {
  value = ["${aws_instance.private_test.0.public_ip}"
  ,"${aws_instance.private_test.0.private_ip}"]
}

output "private_test_1_ips" {
  value = ["${aws_instance.private_test.1.public_ip}"
  ,"${aws_instance.private_test.1.private_ip}"]
}

# output "s3_log_bucket_arn"{
#   value = ["${aws_s3_bucket.log_bucket.arn}"]
# }
