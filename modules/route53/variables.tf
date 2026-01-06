variable "zone_id" {
  type        = string
  description = "Route53 Hosted Zone ID"
}

variable "aliases" {
  type        = list(string)
  description = "Domain aliases to create A records for"
}

variable "cloudfront_domain" {
  type        = string
  description = "CloudFront distribution domain name"
}

variable "cloudfront_zone_id" {
  type        = string
  description = "CloudFront distribution hosted zone ID"
}
