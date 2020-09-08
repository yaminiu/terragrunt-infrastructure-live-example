
locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment
}

terraform {
  source = "git::git@github.com:yaminiu/aws-terraform-vpc_basenetwork.git"
  # Intentionally empty. Will be filled by Terragrunt.
  #backend "s3" {}
}

include {
  path = find_in_parent_folders()
}

