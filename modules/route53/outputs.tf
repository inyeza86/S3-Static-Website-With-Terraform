output "records" {
  description = "The Route53 records created for the CloudFront distribution aliases"
  #value       = { for k, v in aws_route53_record.cloudfront : k => v.fqdn }
  value = aws_route53_record.cloudfront[*].fqdn
}
