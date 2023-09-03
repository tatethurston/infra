terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
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
}

module "squid" {
  source      = "./module/github"
  name        = "squid"
  description = "App monorepo"
  visibility  = "private"
}

module "validation_object" {
  source      = "./module/github"
  name        = "validation-object"
  description = "A validation framework for objects"
  visibility  = "public"

  template = {
    owner      = "tatethurston"
    repository = "typescript-package-template"
  }
}

module "rails-starter" {
  source      = "./module/github"
  name        = "rails-starter"
  description = "Opinionated Rails Starter"
  visibility  = "public"
}

module "terraform-modules" {
  source      = "./module/github"
  name        = "terraform-modules"
  description = "Shared Terraform Modules"
  visibility  = "public"
}

