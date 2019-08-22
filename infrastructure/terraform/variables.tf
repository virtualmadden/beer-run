variable "region" {
  default = "us-west-2"
}

variable "prefix" {
  default = "beerrun.virtualmadden.dev"
}

data "aws_caller_identity" "current" {}

data "aws_route53_zone" "origin" {
  name         = "virtualmadden.dev."
  private_zone = false
}

provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket               = "vrtlmdn-terraform-state"
    key                  = "beer_run"
    workspace_key_prefix = "beer_run"
    region               = "us-west-2"
  }
}
