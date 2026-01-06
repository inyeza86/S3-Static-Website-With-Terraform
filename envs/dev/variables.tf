variable "bucket_name" {
  description = "The name of the S3 bucket to host the static website"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, prod)"
  type        = string
}
variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "domain_name" {
  description = "The primary domain name for the website"
  type        = string
}

variable "aliases" {
  description = "The list of domain names for CloudFront distribution"
  type        = list(string)
}

variable "s3_origin_id" {
  description = "The origin ID for the CloudFront distribution"
  type        = string
}

variable "hosted_zone_id" {
  type        = string
  description = "Route53 Hosted Zone ID"

}

# variable "my_domain" {
#   description = "The primary domain name for the website"
#   type        = string
# }
