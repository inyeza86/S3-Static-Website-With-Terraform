# Terraform configuration for production environment
# Uses modules to set up S3, ACM, CloudFront, Route53
# Variables are defined in variables.tf and values provided in prod.tfvars
# Backend configuration is in backend.tf
# Outputs are defined in outputs.tf
# This file ties together all the modules and passes necessary variables

data "aws_route53_zone" "my_domain" {
  name         = var.domain_name
  private_zone = false
}
module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name
  environment = var.environment
}

module "acm" {
  source      = "../../modules/acm"
  domain_name = var.domain_name
  aliases     = local.aliases
}

module "cloudfront" {
  source             = "../../modules/cloudfront"
  bucket_domain_name = module.s3.bucket_domain_name
  oac_id             = module.s3.oac_id
  certificate_arn    = module.acm.certificate_arn
  #aliases            = local.aliases
  s3_origin_id = var.s3_origin_id
  environment  = var.environment
  project_name = var.project_name
  bucket_name  = var.bucket_name
  domain_name  = var.domain_name

}

module "route53" {
  source      = "../../modules/route53"
  zone_id     = data.aws_route53_zone.my_domain.zone_id
  domain_name = var.domain_name
  #aliases            = local.aliases
  cloudfront_domain  = module.cloudfront.domain_name
  cloudfront_zone_id = module.cloudfront.hosted_zone_id
}
