output "website_url" {
  description = "The URL of the static website"
  value       = [for a in var.aliases : "https://${a}"]
}
output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = module.cloudfront_distribution.id
}
