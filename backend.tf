terraform {
  backend "s3" {
    bucket       = "messan-s3"
    key          = "s3-static-website/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    profile      = "messan"
  }
}
