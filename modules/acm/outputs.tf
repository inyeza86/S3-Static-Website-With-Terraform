output "aws_acm_certificate_id" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.website_cert.id
}

output "aws_acm_certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate_validation.website_cert_validation.certificate_arn
}

output "certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.website_cert.arn
}
