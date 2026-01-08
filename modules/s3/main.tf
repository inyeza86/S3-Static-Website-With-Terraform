resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.bucket_name
}

# Block public access to the bucket

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.static_website_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


# Create CloudFront Origin Access Control for the S3 bucket

resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "${var.bucket_name}-oac"
  description                       = "Origin Access Control for ${var.bucket_name}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"


}

# bucket policy to allow CloudFront access

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket     = aws_s3_bucket.static_website_bucket.id
  depends_on = [aws_s3_bucket_public_access_block.block_public_access]

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowCloudFrontServicePrincipalReadOnly",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "cloudfront.amazonaws.com"
        },
        "Action" : [
          "s3:GetObject",
        ],
        "Resource" : "${aws_s3_bucket.static_website_bucket.arn}/*",
        "Condition" : {
          "StringEquals" : {
            "AWS:SourceArn" : aws_cloudfront_distribution.s3_distribution.arn
          }
        }
      }
    ]
  })
}

# upload website content to the S3 bucket
# resource "aws_s3_object" "website_content" {
#   for_each = fileset("${path.module}/website-content", "**/*")

#   bucket = aws_s3_bucket.static_website_bucket.id
#   key    = each.value
#   source = "${path.module}/website-content/${each.value}"
#   etag   = filemd5("${path.module}/website-content/${each.value}")

#   content_type = lookup({
#     html = "text/html"
#     css  = "text/css"
#     js   = "application/javascript"
#     png  = "image/png"
#     jpg  = "image/jpeg"
#     jpeg = "image/jpeg"
#     gif  = "image/gif"
#     svg  = "image/svg+xml"
#     ico  = "image/x-icon"
#   }, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
# }
