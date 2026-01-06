variable "domain_name" {
  description = "The primary domain name for the website"
  type        = string
}

variable "aliases" {
  description = "The list of domain names for CloudFront distribution"
  type        = list(string)
}
