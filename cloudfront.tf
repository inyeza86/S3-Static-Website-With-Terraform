resource "aws_cloudfront_distribution" "s3_distribution" {
  aliases = var.aliases
  origin {
    domain_name              = aws_s3_bucket.static_website_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
    origin_id                = local.s3_origin_id
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront Distribution for ${var.bucket_name} S3 Static Website"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https" # Enforce HTTPS
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }


  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      #   restriction_type = "whitelist" # Only allow specific countries
      #   locations        = ["US", "CA", "GB", "DE"] # Example countries
    }
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate_validation.website_cert_validation.certificate_arn
    ssl_support_method  = "sni-only"
  }
}

# Create Route53 records for the CloudFront distribution aliases
data "aws_route53_zone" "my_domain" {
  name         = local.my_domain
  private_zone = false
}

resource "aws_route53_record" "cloudfront" {
  for_each = toset(var.aliases)
  zone_id  = data.aws_route53_zone.my_domain.zone_id
  name     = each.value
  type     = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
