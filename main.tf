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

module "validation_object" {
  source       = "./module/github"
  name         = "validation-object"
  description  = "A validation framework for objects"
  visibility   = "public"

  template = {
    owner      = "tatethurston"
    repository = "typescript-package-template"
  }
}

module "squid" {
  source       = "./module/github"
  name         = "squid"
  description  = "App monorepo"
  visibility   = "private"
}
