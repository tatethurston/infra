terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.84"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tatethurston-terraform-state"
    key    = "infra"
    region = "us-west-1"
  }
}

provider "github" {
  token = var.github_token
}

module "infra" {
  source      = "./module/github"
  name        = "infra"
  description = "personal infra"
  visibility  = "public"
  pages       = false
}

module "squid" {
  source      = "./module/github"
  name        = "squid"
  description = "App monorepo"
  visibility  = "private"
  pages       = false
}

module "validation-object" {
  source      = "./module/github"
  name        = "validation-object"
  description = "A validation framework for objects"
  visibility  = "public"

  template = {
    owner      = "tatethurston"
    repository = "typescript-package-template"
  }
  pages = false
}

module "rails-starter" {
  source      = "./module/github"
  name        = "rails-starter"
  description = "Opinionated Rails Starter"
  visibility  = "public"
  pages       = false
}

module "terraform-modules" {
  source      = "./module/github"
  name        = "terraform-modules"
  description = "Shared Terraform Modules"
  visibility  = "public"
  pages       = false
}

module "ruby-debezium" {
  source      = "./module/github"
  name        = "ruby-debezium"
  description = "A gem to handle CDC messages from Debezium"
  visibility  = "public"
  pages       = true
}

module "activerecord_explicit_fields" {
  source      = "./module/github"
  name        = "activerecord_explicit_fields"
  description = "Explicit fields for ActiveRecord"
  visibility  = "public"
  pages       = true
}

module "book-worm" {
  source      = "./module/github"
  name        = "book-worm"
  description = "Emily's book app"
  visibility  = "private"
  pages       = false
}

module "aws-org" {
  source      = "./module/github"
  name        = "aws-org-lab"
  description = "AWS Organization for Lab"
  visibility  = "private"
  pages       = false
}








