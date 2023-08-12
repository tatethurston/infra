variable "name" {
  description = "Name of the repository"
}

variable "description" {
  description = "Description of the repository"
}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

resource "github_repository" "repo" {
  name         = var.name
  description  = var.description
  visibility   = "public"
  auto_init    = true

  allow_merge_commit     = false 
  allow_squash_merge     = true 
  allow_rebase_merge     = false 
  allow_auto_merge       = false 
  delete_branch_on_merge = true

  has_issues      = true
  has_discussions = true
  has_projects    = false
  has_wiki        = false

  template {
    owner      = "tatethurston"
    repository = "typescript-package-template"
  }
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.repo.node_id

  pattern                 = "main"
  enforce_admins          = true 
  require_signed_commits  = true
  allows_deletions        = false
  allows_force_pushes     = false
  required_linear_history = true
}

