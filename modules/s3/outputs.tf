output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.static_website_bucket.arn
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.static_website_bucket.bucket
}

output "bucket_domain_name" {
  value = aws_s3_bucket.static_website_bucket.bucket_regional_domain_name
}

output "oac_id" {
  value = aws_cloudfront_origin_access_control.oac.id
}
