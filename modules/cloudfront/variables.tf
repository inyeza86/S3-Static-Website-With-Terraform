variable "s3_origin_id" {
  description = "The origin ID for the CloudFront distribution"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate for the CloudFront distribution"
  type        = string
}

variable "aliases" {
  description = "The list of domain names for CloudFront distribution"
  type        = list(string)
}

variable "bucket_domain_name" {
  type        = string
  description = "S3 bucket domain name for origin"
}

variable "oac_id" {
  type        = string
  description = "CloudFront Origin Access Control ID"
}

variable "environment" {
  description = "The deployment environment (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket to host the static website"
  type        = string
}
