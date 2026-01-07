locals {
  aliases = [
    var.domain_name,
    "www.${var.domain_name}"
  ]
}
