variable "region" {
  default = "us-west-2"
}

provider "aws" {
  region = "${var.region}"
}

variable "domain" {
  default = "beerrun.virtualmadden.dev"
}

data "aws_caller_identity" "current" {}

data "aws_route53_zone" "origin" {
  name         = "virtualmadden.dev."
  private_zone = false
}

terraform {
  backend "s3" {
    bucket               = "vrtlmdn-terraform-state"
    key                  = "beer-run"
    region               = "us-west-2"
  }
}
