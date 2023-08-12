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

module "gh_repo_validation_object" {
  source       = "./module/github"
  name         = "validation-object"
  description  = "A validation framework for objects"

  providers = {
    github = github
  }
}
