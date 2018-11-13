## S3 bucket
resource "aws_s3_bucket" "log_bucket"{
  bucket = "inet4007.logging.bucket"
  acl = "log-delivery-write" # DO NOT SET THIS TO PUBLIC; See `Canned ACL` AWS documentation for more info
  region = "${var.aws_region}"
  versioning {
    enabled = true
  }
  logging {
    target_bucket = "inet4007.logging.bucket"
    target_prefix = "serverAccessLogging"
  }
}

resource "aws_flow_log" "access_flow_log" {
  log_destination = "${aws_s3_bucket.log_bucket.arn}"
  log_destination_type = "s3"
  traffic_type = "ALL"
  vpc_id = "${aws_vpc.default.id}"
}
