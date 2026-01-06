variable "bucket_name" {
  description = "The name of the S3 bucket to host the static website"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, prod)"
  type        = string
}
