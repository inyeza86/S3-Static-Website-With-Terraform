output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.static_website_bucket.arn
}

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "acm_certificate_id" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.website_cert.id
}
output "website_url" {
  description = "The URL of the static website"
  value       = [for a in var.aliases : "https://${a}"]
}
output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.id
}
