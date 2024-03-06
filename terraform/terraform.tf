terraform {
  required_version = "~> 1.6"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    key = "web-static-assets/dev/terraform.tfstate"
  }
}

locals {
  project_name = "web-static-assets"
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      project = local.project_name
    }
  }
}
