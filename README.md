# Infra

Terraform-managed GitHub repositories.

## How it works

Changes follow a standard GitOps workflow:

1. Open a pull request — CI runs `terraform plan` and posts the output as a PR comment
2. Review the plan, then merge — CI runs `terraform apply` against the exact plan that was reviewed

Terraform state is stored remotely in S3 with DynamoDB locking.

## Adding a repository

Add a new module block to `main.tf`:

```hcl
module "my-new-repo" {
  source      = "./module/github"
  name        = "my-new-repo"
  description = "What this repo is for"
  visibility  = "public"
  pages       = false
}
```

Open a PR — the plan will show the repository that will be created. Merge to apply.
