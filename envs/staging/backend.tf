terraform {
  backend "s3" {
    bucket       = "inyeza-staging"
    key          = "s3-static-website/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    profile      = "messan"
  }
}
