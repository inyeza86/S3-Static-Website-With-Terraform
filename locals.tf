locals {
  s3_origin_id = "s3-${aws_s3_bucket.static_website_bucket.id}"
  my_domain    = "inyeza86.com"
}
