resource "aws_s3_bucket" "origin" {
  bucket = "${var.prefix}"
  acl    = "private"
}
