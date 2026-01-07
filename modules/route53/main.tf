# Fetch the Route53 hosted zone information
# data "aws_route53_zone" "my_domain" {
#   name         = var.domain_name
#   private_zone = false
# }

# Create Route53 records for the CloudFront distribution aliases
resource "aws_route53_record" "cloudfront" {
  for_each = toset(local.aliases)
  zone_id  = var.zone_id
  name     = each.value
  type     = "A"

  alias {
    name                   = var.cloudfront_domain
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}
