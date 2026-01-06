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

variable "aliases" {
  description = "The list of domain names for CloudFront distribution"
  type        = list(string)
}
